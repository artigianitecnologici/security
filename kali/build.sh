# docker build -t kali-vnc .
docker stop kali-vnc
docker rm kali-vnc

docker compose up --build  # -d

