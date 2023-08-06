FROM golang:1.20-alpine as builder

# Set destination for COPY
WORKDIR /app

# Download Go modules
COPY go.mod go.sum ./
RUN go mod download

# Copy all files
ADD . /app/

# Build
RUN CGO_ENABLED=0 GOOS=linux go build -o runner ./cmd/runner.go 

# Run
CMD ["/app"]

# Runtime stage
FROM alpine:3.18
WORKDIR /app
COPY --from=builder /app/runner .
ENV  GIN_MODE release
EXPOSE 8000
CMD ["./runner"]