nextflow.enable.dsl=2

include { FASTQC } from './modules/fastqc'
include { FASTP } from './modules/fastp'
include { STAR } from './modules/star'
include { FEATURECOUNTS } from './modules/featurecounts'
include { MULTIQC } from './modules/multiqc'

workflow {
    println "RNA-seq Pipeline Started"
     
    reads_ch = Channel.fromFilePairs(params.reads)

    FASTQC(reads_ch)

    trimmed_ch = FASTP(reads_ch)

    aligned_ch = STAR(trimmed_ch)

    counts_ch = FEATURECOUNTS(aligned_ch)

    MULTIQC(counts_ch)
}
