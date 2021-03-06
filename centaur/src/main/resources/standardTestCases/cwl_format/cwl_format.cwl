cwlVersion: v1.0
$namespaces:
  edam: http://edamontology.org/
  gx: http://galaxyproject.org/formats/
$schemas:
  - file:./cwl/src/test/resources/cwl/ontology/EDAM.owl
  - file:./cwl/src/test/resources/cwl/ontology/gx_edam.ttl
$graph:
- id: main
  class: CommandLineTool
  cwlVersion: v1.0
  inputs:
    - id: reference
      type: File
      format: gx:fasta
      inputBinding: { position: 2 }
  outputs:
    - id: lineCount
      type: int
      outputBinding:
        glob: stdout
        loadContents: true
        outputEval: "$(parseInt(self[0].contents))"
  baseCommand: ["wc", "-l"]
  stdout: stdout
