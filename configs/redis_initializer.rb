require 'redis'

REDIS_HOST='localhost'
REDIS_PORT=6379
REDIS_DB='app_redis'
REDIS= Redis.new(host: REDIS_HOST, port: REDIS_PORT, db: REDIS_DB)