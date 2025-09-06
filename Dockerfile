# #stage 1 : Build stage

# #base image
# FROM ubuntu AS build

# #installing dependencies
# RUN apt-get update && apt-get install -y \
#     python3 python3-venv python3-pip build-essential

# #working directory
# WORKDIR /app

# #make venv
# RUN python3 -m venv /opt/venv

# #define path 
# ENV PATH="/opt/venv/bin:$PATH"

# #copy packages
# COPY requirements.txt .

# #install packages
# RUN pip install --upgrade pip \
#     && pip install --no-cache-dir -r requirements.txt

# #copy project
# COPY . .

# #stage 2 : Runtime stage

# #base image
# FROM ubuntu 

# #dependency
# RUN apt-get update && apt-get install -y \
#     python3 

# #working direc
# WORKDIR /app

# COPY --from=build /opt/venv /opt/venv
# COPY --from=build /app /app

# ENV PATH="/opt/venv/bin:$PATH"

# EXPOSE 8000
# CMD [ "python3","manage.py","runserver","0.0.0.0:8000" ]



#using python-slim

#build stage
FROM python:3.10-slim AS build

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt 

COPY . .

#runtime stage
FROM python:3.10-slim

ENV PYTHONDONTBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /app

COPY --from=build /usr/local/lib/python3.10/site-packages/ /usr/local/lib/python3.10/site-packages/
COPY --from=build /app /app

EXPOSE 8000
CMD [ "python","manage.py","runserver","0.0.0.0:8000" ]