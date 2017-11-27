import os

import GPS
import gps_utils
import workflows
import workflows.promises as promises
from workflows import task_workflow



class RunAllWorkflow:

    def __init__(self):
#        GPS.Menu.create("/Build/Run/Run All")
        gps_utils.make_interactive(callback=lambda: task_workflow("Run all", self.__do_run_all), 
                    category= "Run", 
                    name="Run All", 
                    toolbar='main',
                    menu='/Build/Run/Run All', 
                    description='Run all executables in project')

    def __console_msg(self, msg, mode="text"):
        GPS.Console("Messages").write(msg + "\n", mode=mode)


    def __error_exit(self, msg=""):
        self.__console_msg(msg, mode="error")
        self.__console_msg("[workflow stopped]", mode="error")

    def __log_output(self, path, exec_name, output):
        filename = "%s.log" % (exec_name)

        # overwrite file if it already
        with open(os.path.join(path, filename), 'w+') as f:
            f.write(output)

    def __do_run_all(self, task):
        base_proj = GPS.Project.root()
        proj_list = base_proj.dependencies(recursive = True)

        # since the top level project may have executables we have 
        # to add it to the project list
        proj_list.append(base_proj)

        # loop over each project in top level dependencies
        for proj in proj_list:
            # get all executables list in project
            exec_list = proj.get_attribute_as_list("main")

            # if there are no executables, then skip this project
            if len(exec_list) > 0:
                self.__console_msg("Running %s..." % proj.name())

                # get list of sources in project
                sources = proj.sources()

                # loop over each executable in project
                for ex in exec_list:

                    # find the executable in the list of project sources
                    for source in sources:
                        if os.path.basename(source.path) == ex:

                            # now we have the full path of the executable
                            exec_path = source.executable_path.path
                            exec_name = os.path.basename(exec_path)
                            try:
                                proc = promises.ProcessWrapper([exec_path], spawn_console="")
                            except:
                                self.__console_msg("Could not run %s" % exec_name, mode="error")
                                self.__console_msg("[workflow stopped]", mode="error")
                                return
                            ret, output = yield proc.wait_until_terminate()
                            if ret is not 0:
                                self.__error_exit("{} returned an error.".format(exec_name))
                                return

                            # log output of executable run to file
                            self.__log_output(proj.artifacts_dir(), exec_name, output)
                            break


                
                

def initialize_project_plugin():
    """
    Entry point hook to GPS
    """
    RunAllWorkflow()
 