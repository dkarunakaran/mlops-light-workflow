

* Project oveview

This project is to demostrate a workflow what "Practical MLOPs" book called MLOPS light workflow

Code pushed to Github -> CI -> Google's container registry-> CD -> GKE


* Continous Integration (CI)

This is done in github Actions. The config stored stored in .github/workflows/publish_build_containerize.yaml

* Build as a container and push to container registry

This is done in Github actions. The config stored stored in .github/workflows/publish_build_containerize.yaml


* Continous Deployment (CD)

This is done is GCP cloud build that will depoly to GKE
