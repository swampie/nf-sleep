#!/usr/bin/env nextflow

params.timeout = 5
params.exit = 0
params.times = 1
params.forks = 1

process foo {
    maxForks params.forks

    input:
    val x

    script:
    """
    echo "Hello from v2 syntax (item ${x}, timeout ${params.timeout}s)"
    sleep ${params.timeout}
    exit ${params.exit}
    """
}

workflow {
    channel.of(1..params.times) | foo
}
