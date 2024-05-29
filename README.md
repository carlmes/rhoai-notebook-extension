# RHOAI Notebook Extension
A project that demonstrates how one could to extend a RHOAI datascience image

## Building and Running Locally

To build and tag this image using podman:
```sh
$ podman build -t "datasciencenotebook" . 
```

To run the image locally:
```sh
$ podman run --rm -p 8888:8888 --name "DataScienceNotebook" datasciencenotebook
```

The Jupyter UI can be accessed using http://localhost:8888 once the pod has started up. Check the pod logs for the token required to access the UI.

## References

* Quay.io repository for the [workbench-images](https://quay.io/repository/opendatahub/workbench-images?tab=tags)
* Source code for the [notebooks](https://github.com/opendatahub-io/notebooks)
* Run:AI documentation: [Use a Jupyter Notebook with a Run:ai Job](https://docs.run.ai/v2.13/Researcher/tools/dev-jupyter/)
* Suggestions for [hosting Jupyter under a Conda environment](https://stackoverflow.com/a/58068850)
* An older (Python 3.8 based) example of an [Anaconda Container UBI](https://github.com/opendatahub-io/notebooks/blob/main/base/anaconda-python-3.8/Dockerfile)
* Blog: [Deploying conda environments in (Docker) containers - how to do it right](https://uwekorn.com/2021/03/01/deploying-conda-environments-in-docker-how-to-do-it-right.html)
* OpenShift documentation: [Starting with containers](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/9/html-single/building_running_and_managing_containers/index#assembly_starting-with-containers_building-running-and-managing-containers)
