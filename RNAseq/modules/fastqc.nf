process FASTQC {

    tag "$sample_id"

    input:
    tuple val(sample_id), path(reads)

    output:
    path "fastqc/*"

    script:
    """
    mkdir -p fastqc

    fastqc \
        -o fastqc \
        $reads
    """
}
