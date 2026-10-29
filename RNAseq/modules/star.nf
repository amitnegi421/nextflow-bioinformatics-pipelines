process STAR {

    input:
    tuple val(sample_id), path(reads)
    path star_index

    output:
    tuple val(sample_id), path("*.bam")

    script:
    """
    STAR \
        --genomeDir $star_index \
        --readFilesIn ${reads[0]} ${reads[1]} \
        --readFilesCommand zcat \
        --outSAMtype BAM SortedByCoordinate \
        --runThreadN ${task.cpus}

    mv Aligned.sortedByCoord.out.bam ${sample_id}.bam
    """
}
