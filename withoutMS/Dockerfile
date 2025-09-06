#Base Image
FROM ubuntu

#installing system dependencies
RUN apt-get update && apt-get install -y \
    python3 python3-venv python3-pip build-essential libpq-dev

#working directory
WORKDIR /app

#making virtual environment
RUN python3 -m venv /opt/venv

#ensure path to venv
ENV PATH="/opt/venv/bin:$PATH"

RUN pip  install --upgrade pip 

#copy packages
COPY requirements.txt .

RUN  pip install --no-cache-dir -r requirements.txt

#copy whole project
COPY . .

#export port
EXPOSE 8000

#start app
CMD [ "python","manage.py","runserver","0.0.0.0:8000" ]
