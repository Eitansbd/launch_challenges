=begin
Lets write a program that will translate RNA sequences into proteins. RNA can be
broken into three nucleotide sequences called codons, and then translated to a
polypeptide like so:

RNA: "AUGUUUUCU" => translates to

Codons: "AUG", "UUU", "UCU"
=> which become a polypeptide with the following sequence =>

Protein: "Methionine", "Phenylalanine", "Serine"
There are 64 codons which in turn correspond to 20 amino acids; however, all of
the codon sequences and resulting amino acids are not important in this exercise.

There are also four terminating codons (also known as 'STOP' codons); if any of
these codons are encountered (by the ribosome), all translation ends and the
protein is terminated. All subsequent codons after are ignored, like this:

RNA: "AUGUUUUCUUAAAUG" =>

Codons: "AUG", "UUU", "UCU", "UAA", "AUG" =>

Protein: "Methionine", "Phenylalanine", "Serine"
Note the stop codon terminates the translation and the final methionine is not
translated into the protein sequence.--

Below are the codons and resulting Amino Acids needed for the exercise.

Codon	Amino Acids
AUG	Methionine
UUU, UUC	Phenylalanine
UUA, UUG	Leucine
UCU, UCC, UCA, UCG	Serine
UAU, UAC	Tyrosine
UGU, UGC	Cysteine
UGG	Tryptophan
UAA, UAG, UGA	STOP
=end

class InvalidCodonError < StandardError; end

class Translation
  CODON_TO_AA = {
    %w(AUG) => 'Methionine',
    %w(UUU UUC) =>	'Phenylalanine',
    %w(UUA UUG) =>	'Leucine',
    %w(UCU UCC UCA UCG) =>	'Serine',
    %w(UAU UAC) =>	'Tyrosine',
    %w(UGU UGC) =>	'Cysteine',
    %w(UGG) =>	'Tryptophan',
    %w(UAA UAG UGA) =>	'STOP'
  }

  def self.of_codon(codon)
    CODON_TO_AA.each do |codon_group, amino_acid|
      return amino_acid if codon_group.include? codon
    end

    raise InvalidCodonError, "The string you entered is not a valid codon"
  end

  def self.of_rna(strand)
    aa_array =[]
    strand.scan(/.../) do |codon|
      aa = self.of_codon(codon)
      break if aa == 'STOP'
      aa_array << aa
    end
    aa_array
    # returns an array of the AA
    # should raise InvalidCodonError if strand isn't a valid codon.
  end
end
strand = 'AUGUUUUAA'
Translation.of_rna(strand)