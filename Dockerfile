# pull the official image
FROM python:3.7

# set work directory
WORKDIR /usr/src/app

RUN apt-get update
RUN apt-get -y install libglib2.0-0

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install dependencies
RUN pip install --upgrade pip 
COPY ./requirements.txt /usr/src/app
RUN pip install -r requirements.txt
RUN pip install opencv-contrib-python
RUN pip install numpy

# copy project
COPY . /usr/src/app

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
