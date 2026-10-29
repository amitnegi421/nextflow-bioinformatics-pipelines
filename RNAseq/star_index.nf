process STAR_INDEX {

    input:
    path genome
    path annotation

    output:
    path "star_index"

    script:
    """
    mkdir -p star_index

    STAR \
        --runMode genomeGenerate \
        --genomeDir star_index \
        --genomeFastaFiles $genome \
        --sjdbGTFfile $annotation \
        --runThreadN ${task.cpus}
    """
}
