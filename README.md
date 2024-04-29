

# Project oveview

This project is to demostrate a workflow what "Practical MLOPs" book called MLOPS light workflow

Code pushed to Github -> CI -> build contianer-> Google's container registry-> CD -> GKE


## Continous Integration (CI)

This is done in github Actions. The config stored stored in .github/workflows/publish_build_containerize.yaml

We define following content in Makefile to install, lint, and test

```
install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

test:
	pytest -vv --cov-report term-missing --cov=app test_*.py

format:
	black *.py

lint:
	pylint --disable=R,C app.py 

all: install lint test
```


## Build as a container and push to container registry

This is done in Github actions here, but ideally if the container registry provided by gloud provider, then use their build server for containerization and pushing to registry. The config stored stored in .github/workflows/publish_build_containerize.yaml

## Continous Deployment (CD)

This is done is GCP cloud build that will depoly to GKE
