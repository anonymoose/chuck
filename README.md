

# s/CHUCK/KEN/g

Chuck Norris facts, retold as Ken Bedwell facts.


# The Plan.

Clone this repo.

Build an image and push it.

Deploy it to kubernetes.

Show some jokes via curl.


# The Details.

This is a Python 3 / Flask project that currently exposes one endpoint.  You need to deploy it to kubernetes on AWS.  You don't have to build the cluster, it's already up.

You have been provided with shell scripts that take care of some of the fiddly bits around working with Python on Docker/K8s.


# Get it running locally

Clone this repo to your laptop.

Provided you have pip3 and python3 in your path, the following should work nicely to setup your development environment.

```
12:50 PM|kb|~/dev/H/chuck> cd chuck
12:50 PM|kb|~/dev/H/chuck> bin/devenv
/usr/local/bin/pip3
Requirement already up-to-date: pip in /usr/local/lib/python3.7/site-packages (18.1)
Requirement already up-to-date: virtualenv in /usr/local/lib/python3.7/site-packages (16.0.0)
Running virtualenv with interpreter /usr/local/bin/python3
Using base prefix '/usr/local/Cellar/python/3.7.0/Frameworks/Python.framework/Versions/3.7'
/usr/local/lib/python3.7/site-packages/virtualenv.py:1041: DeprecationWarning: the imp module is deprecated in favour of importlib; see the module's documentation for alternative uses
  import imp
New python executable in /Users/ken.bedwell/dev/H/chuck/venv/bin/python3.7
Also creating executable in /Users/ken.bedwell/dev/H/chuck/venv/bin/python
Installing setuptools, pip, wheel...done.
Collecting certifi==2018.10.15 (from -r ./requirements.txt (line 1))
  Using cached https://files.pythonhosted.org/packages/56/9d/1d02dd80bc4cd955f98980f28c5ee2200e1209292d5f9e9cc8d030d18655/certifi-2018.10.15-py2.py3-none-any.whl
Collecting chardet==3.0.4 (from -r ./requirements.txt (line 2))
  Using cached https://files.pythonhosted.org/packages/bc/a9/01ffebfb562e4274b6487b4bb1ddec7ca55ec7510b22e4c51f14098443b8/chardet-3.0.4-py2.py3-none-any.whl
<<<<< blah blah blah >>>

```


Next run it locally

```
12:50 PM|kb|~/dev/H/chuck> bin/run
---------------------------------------------------------
--              Running Flask Locally                  --
---------------------------------------------------------
 * Serving Flask app "chuck"
 * Environment: development
 * Debug mode: off
 * Running on http://127.0.0.1:8080/ (Press CTRL+C to quit)
```

You should be able to curl the api and get some facts back in JSON format.  See the code to figure out what the endpoint path is.


# Access

You'll need AWS access to push to the "chuck" registry.
Run this in any shell from which you'll be running `docker login` and `docker push`

```
export AWS_ACCESS_KEY_ID=AKIAxxxxxxxxxxxxxxxQ
export AWS_SECRET_ACCESS_KEY=9l+LfxxxxxxxxxxxxxxxxxxxxxxxxxxxxeCk
export AWS_DEFAULT_REGION=us-east-1
```

Next, log into the repository.  If you are unfamiliar with Docker repositories (ECR) that's not a problem since its cloud-specific, we'll get you set up.


# Build it, Tag it, Push it

```
Exercise left to the reader.
```

A Dockerfile has been provided.

The repository URI is:

```
015417194031.dkr.ecr.us-east-1.amazonaws.com/chuck
```


# Connect to k8s.

*MAKE SURE YOU BACK UP YOUR ~/.kube DIRECTORY*

You will be provided with a ~/.kube/config file to drop into your ~/.kube directory.

Check connectivity by showing the running nodes and list the pods in the system namespace.  This cluster was created with Kops and all attendant AWS integrations are present.  Your user is the admin user.  RBAC is on but that should not matter.


# Deploy your app to k8s

```
Exercise left to the reader
```

Requirements:

Chuck needs a namespace and ultimately needs to live in it.

Create all requisite deployment files for kubernetes to deploy this to k8s and access it externally.  Helm is neither required nor preferred.

You can create an ingress, or not, depending on your tastes.

Curl your endpoint and show some jokes on the AWS kubernetes.


# Extra credit

- Ken has been fired from the company.  His name is hard coded into the source.  Modify the source code to make the name configurable and alter the deployment to pass the new name as an environment variable.




