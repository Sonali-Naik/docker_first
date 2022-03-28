FROM python:3.9-slim-bullseye

#Create Virtual ENvironment and make it available to whole container
ENV VIRTUAL_ENV=/opt/venev

#RUN 
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# Install dependencies:
COPY requirements.txt .
RUN pip install -r requirements.txt

# Run the application:
COPY app.py .

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]