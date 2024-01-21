
rem Load environment variables from .env file
for /f "tokens=*" %%A in (./../.env) do (
    set %%A
)

::  * Build a customized official Jenkins Docker image
docker build -t %CUSTOMIZED_IMAGE_NAME% ./../

pause
