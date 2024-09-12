#!/bin/bash

# List of all .qmd files
files=(
    whypoker.qmd pokercamp.qmd problemsolving.qmd games.qmd basicstrategy.qmd ethics.qmd
    python.qmd aiagents.qmd buildingaiagents.qmd
    algebra.qmd probability.qmd combinatorics.qmd expectedvalue.qmd bayesrule.qmd statistics.qmd montecarlo.qmd
    logic.qmd knowledgerepresentation.qmd rationality.qmd psychology.qmd
    probabilisticthinking.qmd decisiontheory.qmd risk.qmd regret.qmd bandits.qmd
    nash.qmd gto.qmd mixedstrategies.qmd
    perfectinfo.qmd minimax.qmd imperfectinfo.qmd
    analytical.qmd normalform.qmd optimization.qmd sequenceform.qmd
    algorithm.qmd interactive.qmd proof.qmd algimprovements.qmd montecarlocfr.qmd vectorcfr.qmd
    gamesize.qmd cardabstraction.qmd betabstraction.qmd agentevaluation.qmd
    howsolverswork.qmd usingsolvers.qmd generalizingsolvers.qmd studyingpopulations.qmd solverlimitations.qmd advancedstrategy.qmd tournaments.qmd
    calculus.qmd linearalgebra.qmd infotheory.qmd
    ml.qmd dl.qmd rl.qmd
    nonpoker.qmd multiplayergames.qmd
    deepcfr.qmd toppokeragents.qmd variancereduction.qmd humanvsai.qmd newresearch.qmd
    transformers.qmd othellogpt.qmd pokergpt.qmd interpretability.qmd
    bestresponse.qmd exploitativestrategies.qmd
    shortterm.qmd longterm.qmd
    trading.qmd predictionmarkets.qmd otherbetting.qmd
    projects.qmd
)

# Function to convert filename to title
filename_to_title() {
    echo "$1" | sed 's/\.qmd$//' | sed 's/\b\(.\)/\u\1/g' | sed 's/[A-Z]/ &/g' | sed 's/^ //'
}

# Create files
for file in "${files[@]}"; do
    title=$(filename_to_title "$file")
    cat << EOF > "$file"
# $title {#sec-${file%.qmd}}

Hello

EOF
    echo "Created $file"
done

echo "All files have been created."