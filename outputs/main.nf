#!/usr/bin/env nextflow

params.timeout = 5
params.times   = 2
params.forks   = 1

process foo {
    maxForks params.forks

    input:
    val(x)

    output:
    path("out_${x}.txt")

    script:
    """
    echo "QA4526 output from task ${x}" > out_${x}.txt
    sleep ${params.timeout}
    """
}

workflow {
    main:
    ch = channel.of(1..params.times) | foo

    publish:
    ch >> 'sleep_outputs'
}

output {
    'sleep_outputs' {
    }
}
