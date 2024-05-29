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
