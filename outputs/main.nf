params.timeout = 5
params.times   = 2
params.forks   = 1
process foo {
    maxForks params.forks
    input:  val(x)
    output: path("out_${x}.txt")
    script:
    """
    echo "QA4526 output from task ${x}" > out_${x}.txt
    sleep ${params.timeout}
    """
}
workflow {
    main:
    ch = foo(channel.of(1..params.times))
    publish:
    sleep_outputs = ch
}
output {
    sleep_outputs {
        path 'sleep_outputs'
    }
}
