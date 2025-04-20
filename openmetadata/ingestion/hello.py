from metadata.workflow.metadata import MetadataWorkflow
from metadata.workflow.profiler import ProfilerWorkflow
import yaml
from dotenv import load_dotenv
import os 
from pprint import pprint

load_dotenv(".env")
jwt_token = os.getenv('INGESTION_JWT')
# Specify your YAML configuration
CONFIG = f"""
sink:
  type: metadata-rest
  config: {{}}
workflowConfig:
  loggerLevel: DEBUG
  openMetadataServerConfig:
    hostPort: 'http://localhost:8585/api'
    authProvider: openmetadata
    securityConfig:
      jwtToken: "{jwt_token}"
    storeServiceConnection: true
"""
def run():
    # with open("./source/mysql.yaml", 'r') as source_file:
    #   source_config = yaml.safe_load(source_file)
    # workflow_config = yaml.safe_load(CONFIG)
    
    # final_config = source_config| workflow_config
    # pprint(final_config)
    
    # # final_config = yaml.safe_load(profiler)
    # # # print(workflow_config)
    # workflow = MetadataWorkflow.create(final_config)
    
    
    with open("./source/mysql_profiler.yaml", 'r') as source_file:
      source_config = yaml.safe_load(source_file)
    workflow_config = yaml.safe_load(CONFIG)
    
    final_config = source_config| workflow_config
    pprint(final_config)
    
    # final_config = yaml.safe_load(profiler)
    # # print(workflow_config)
    workflow = ProfilerWorkflow.create(final_config)
    
    workflow.execute()
    workflow.raise_from_status()
    workflow.print_status()
    workflow.stop()


if __name__ == "__main__":
  run()
  