  #!/bin/bash
  echo "Preloading Metabase drivers..."
  java -cp metabase.jar metabase.driver.util$ preload-drivers
  echo "Driver preloading complete."
