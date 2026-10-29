process FEATURECOUNTS {

    tag "$sample_id"

    input:
    tuple val(sample_id), path(bam)

    output:
    path "*.txt"

    script:
    """
    featureCounts \
        -a annotation.gtf \
        -o counts.txt \
        $bam
    """
}
