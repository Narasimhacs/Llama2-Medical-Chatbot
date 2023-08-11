FROM python:3.9-slim

 

# Set the working directory in the container
WORKDIR .

 

# Copy the application files into the container
COPY requirements.txt .

 

# Install system dependencies
RUN apt-get update && apt-get install -y libopenblas-dev

 

RUN pip install --no-cache-dir -r requirements.txt
 



 

# Expose the port your application runs on
EXPOSE 8000

 

# Command to run the application
CMD ["sh", "-c", "python ingest.py && chainlit run model.py -w"]
