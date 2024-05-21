

# Project oveview

This project is to demostrate a workflow what "Practical MLOPs" book called MLOPS light workflow

Code pushed to Github -> CI -> build contianer-> Google's container registry-> CD -> GKE


## Continous Integration (CI)

This is done in github Actions. The config stored stored in .github/workflows/publish_build_containerize.yaml

We define the following content in Makefile to install, lint, and test

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

Then we can add each of the commands in Github actions yaml file as follows

```
- name: Install dependencies
  run: |
    make install
- name: Lint with pylint
  run: |
    make lint
- name: Test with pytest
  run: |
    make test
- name: Format code
  run: |
    make format

```
These will be executed whenever we pushed the code to GitHub.

## Build as a container and push to container registry

This is done in GCP using cloud build.

## Continous Deployment (CD)

This is done is GCP cloud build that will depoly to GKE
