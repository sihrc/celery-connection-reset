import sys

from concurrent.futures import ThreadPoolExecutor
from celery_connection_reset.tasks import add

POOL = ThreadPoolExecutor(100)


def call_and_retrieve(a, b):
    async_result = add.delay(a, b)
    async_result.wait(timeout=100, propagate=True)
    return async_result.get()

if __name__ == "__main__":

    futures = ([
        POOL.submit(call_and_retrieve, a, a)
        for a in range(int(sys.argv[1]))
    ])

    results = [result.result() for result in futures]
    print(results)
