# Stage 1: Build the application
FROM debian:bookworm-slim as builder

# Install build dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    cmake \
    git \
    libssl-dev \
    ca-certificates \
    curl \
    pkg-config

# Set working directory
WORKDIR /app

# Copy the source code
COPY . .

# Configure and build the application
RUN cmake -S . -B build -D CMAKE_BUILD_TYPE=Release
RUN cmake --build build --parallel

# Stage 2: Create the final image
FROM debian:bookworm-slim

# Install runtime dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    libssl3 \
    ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# Copy the built application from the builder stage
COPY --from=builder /app/build/dyad /usr/local/bin/dyad

# Expose the port the application will listen on
EXPOSE 8080

# Run the application
CMD ["dyad"]
