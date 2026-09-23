#!/usr/bin/env nextflow
params.timeout = 240

process useSecret {
    secret 'QA_COMP2186'
    script:
    """
    echo "QA2186 secret_present=\${QA_COMP2186:+yes}"
    echo "QA2186 secret_len=\${#QA_COMP2186}"
    echo "QA2186 secret_sha=\$(printf '%s' "\$QA_COMP2186" | sha256sum | cut -c1-12)"
    sleep ${params.timeout}
    echo "QA2186 done"
    """
}

workflow {
    useSecret()
}
