def get_redis():    
    if not hasattr(g, 'redis'):        
       g.redis = Redis(host="redis", db=0, socket_timeout=5)  
    return g.redis
