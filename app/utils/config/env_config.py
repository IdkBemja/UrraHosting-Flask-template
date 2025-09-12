import os
from dotenv import load_dotenv

# Load environment variables from .env file
load_dotenv()

# Function to get environment variables

def get_port():
    """Get the port from environment variables, default to 5000 if not set."""
    return int(os.getenv("PORT", 5000))
