process STAR {

    tag "$sample_id"

    input:
    tuple val(sample_id), path(reads)

    output:
    tuple val(sample_id), path("*.bam")

    script:
    """
    STAR \
        --readFilesIn ${reads[0]} ${reads[1]} \
        --readFilesCommand zcat \
        --outSAMtype BAM SortedByCoordinate \
        --runThreadN ${task.cpus}

    mv Aligned.sortedByCoord.out.bam ${sample_id}.bam
    """
}
