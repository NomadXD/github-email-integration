# Use the postman/newman image as the base image
#FROM postman/newman
FROM node:18-alpine

# ENV URL "http://go-rest-api-3192360657:8080/api/v1/reading-list"
# ENV API_KEY "eyJraWQiOiJnYXRld2F5X2NlcnRpZmljYXRlX2FsaWFzIiwiYWxnIjoiUlMyNTYifQ.eyJzdWIiOiI2OTA1Y2VhYS02MDRhLTQyZDUtOTMyOC1mMjliZDUzYzk4MWFAY2FyYm9uLnN1cGVyIiwiaXNzIjoiaHR0cHM6XC9cL3N0cy5jaG9yZW8uZGV2OjQ0M1wvb2F1dGgyXC90b2tlbiIsImtleXR5cGUiOiJQUk9EVUNUSU9OIiwic3Vic2NyaWJlZEFQSXMiOlt7InN1YnNjcmliZXJUZW5hbnREb21haW4iOm51bGwsIm5hbWUiOiJHbyBSRVNUIEFQSSAtIFJlYWRpbmcgTGlzdCIsImNvbnRleHQiOiJcL2IzMTI3ZDFjLTE4MGYtNDY5Ni05YWNhLTkwYmM1MjI0ZDRkOFwva2twalwvZ28tcmVzdC1hcGlcL3JlYWRpbmctbGlzdC05NTBcLzEuMC4wIiwicHVibGlzaGVyIjoiY2hvcmVvX3Byb2RfYXBpbV9hZG1pbiIsInZlcnNpb24iOiIxLjAuMCIsInN1YnNjcmlwdGlvblRpZXIiOm51bGx9XSwiZXhwIjoxNjkzOTk4MDkxLCJ0b2tlbl90eXBlIjoiSW50ZXJuYWxLZXkiLCJpYXQiOjE2OTM5OTc0OTEsImp0aSI6IjBjYmE2YTVmLTc3YmEtNGViMy04MGZlLWRhNmYzZTVmMzI0MyJ9.OvcURk3fs_JQT6Av5ZspeNcRLavP5Qs-m24FXBQHVJgndrvwzs0AV4ukj0-NWXDklbnajq5kfJLpTmN-tvM-zjMNHAFgr8zLLTqSvPpB7MQ8fYASJy_VnTwQDxC-VOg5kBC-qM1LvpYcPAzPP3-NT_ISijR3fExOf918RdPf9rpzQxlvnoSEXz6yumySaRRjQabVmo6ATmdYxUbm_ph1BooatIlP-geum9z_QymU5LuY9u75Ov13-tCRvPgXiOiDVCpOGXmy3aoVDnoDN7HvCsEKYjMxD4kiUWKZD5__tF1olhlunYCIbMqmw2vcGAxl8u3OVNLNOZft-341d71VYXX0ANBTOzJJitUBZXthMDr-6NXWHB8hmVbya99PYJRXEEF7W-W6m-nrsSZ-EeAFvZQOFdxft7Y9cLQZaQZckOKmcAYfFSkdHcd7LyqW4QEo5UhzvYSa7zJm_B5yqV8YXB92NN7C3JLuBRjk65nkqzT8y6AhlkVsCTZK3tbLeyLSD7VrNj9qNbfT9NCvPuVf6Snkm-h0FrySxTho5q5NPFTojsu1GZ1o0ciNc8U7xZx0BFKcAYTHr-IXZLiK2uD_afye4NnW3TgMgwHxoP12HpRvH6p1xUUhGH359TuRjVkz25hnkAfaDAdWdT74B0wyrDenclqJ0WGQCgLdREhULsI"

# Copy the Postman collection and environment files to the container
COPY postman-collection-dir/Go_REST_API.postman_collection.json /etc
# COPY my-postman-environment.json /etc/newman

RUN npm i -g newman -y

RUN adduser \
    --disabled-password \
    --gecos "" \
    --home "/nonexistent" \
    --shell "/sbin/nologin" \
    --no-create-home \
    --uid 10014 \
    "choreo"
# Use the above created unprivileged user
USER 10014

# Define the command to run when the container starts
#CMD ["run", "/etc/newman/Go_REST_API.postman_collection.json"]
CMD [ "newman" , "run", "/etc/Go_REST_API.postman_collection.json"]