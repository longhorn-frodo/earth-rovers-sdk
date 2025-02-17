import time
import requests

url = "http://localhost:8000/control"
headers = {"Content-Type": "application/json"}


# forward 20 steps
# Define the data to send
forward_data = {"command": {"linear": 0.5, "angular": 0}}

left_data = {"command": {"linear": 0.5, "angular": 0.5}}

num_commands_executed = 0
num_seconds_executed = 1.25


# TESTING


def send_command(data, seconds):
    global num_commands_executed
    # Send the POST request
    for i in range(int(4 * seconds)):
        start_response = time.time()
        response = requests.post(url, headers=headers, json=data)
        end_response = time.time()
        wait_time = 0.25 - (end_response - start_response)
        time.sleep(wait_time)

        # check if response is successful
        if response.status_code == 200:
            num_commands_executed += 1


send_command(left_data, num_seconds_executed)

print("Executed commands: ", num_commands_executed)
print("Executed commands interval: ", num_seconds_executed)
