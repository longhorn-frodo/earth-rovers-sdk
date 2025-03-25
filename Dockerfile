# Use a base image with Python
FROM --platform=linux/amd64 python:3.9

# Define environment variables
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/google-chrome

# Install necessary packages and Google Chrome
RUN apt-get update \
  && apt-get install -y wget gnupg \
  && wget -qO- https://dl.google.com/linux/linux_signing_key.pub | gpg --dearmor > /usr/share/keyrings/google-chrome.gpg \
  && echo "deb [signed-by=/usr/share/keyrings/google-chrome.gpg] http://dl.google.com/linux/chrome/deb/ stable main" | tee /etc/apt/sources.list.d/google-chrome.list \
  && apt-get update \
  && apt-get install -y google-chrome-stable fonts-ipafont-gothic fonts-wqy-zenhei fonts-thai-tlwg fonts-khmeros fonts-kacst fonts-freefont-ttf libxss1 \
  --no-install-recommends \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy the requirements and source code files
COPY requirements.txt .

# Create a virtual environment and install Python dependencies
RUN python3 -m venv venv && \
  . venv/bin/activate && \
  pip install --no-cache-dir -r requirements.txt

# Set environment variables
ENV PYTHONUNBUFFERED=1
ENV PATH="/app/venv/bin:$PATH"

# Expose the application port
EXPOSE 8000
EXPOSE 8001

WORKDIR /app/earth-rovers-sdk

# Command to run the application
CMD ["/bin/bash"]