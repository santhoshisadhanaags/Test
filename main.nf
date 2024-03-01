nextflow.enable.dsl=2


process make_file {

    // container 'test:latest'

    publishDir "${params.outdir}/", mode: 'copy'

    output:
        path "message.txt"

    """
    echo "${params.message}" > message.txt
    echo "${params.message_greet}" >> message.txt

    """
}

process echo_file {

    // container 'test:latest'

    publishDir "${params.outdir}/", mode: 'copy'

    input:
        path message_file
    output:
        stdout

    """
    cat ${message_file}

    """
}

workflow {
    make_file()
    echo_file(make_file.out).view()
}
