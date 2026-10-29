## RNA-seq Pipeline

Workflow:

```text
FASTQ
  ↓
FASTQC
  ↓
FASTP
  ↓
STAR
  ↓
FEATURECOUNTS
  ↓
MULTIQC
```

### Execution

```bash
nextflow run RNAseq/main.nf -profile docker
```

### Technologies

- Nextflow DSL2
- Docker
- FastQC
- FastP
- STAR
- FeatureCounts
- MultiQC
