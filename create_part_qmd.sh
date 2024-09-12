#!/bin/bash

# Array of part filenames
parts=(
    "intro.qmd"
    "codingfoundations.qmd"
    "mathfoundations.qmd"
    "knowledge.qmd"
    "decisiomakingunderuncertainty.qmd"
    "gametheory.qmd"
    "gametrees.qmd"
    "solvingtoygames.qmd"
    "cfr.qmd"
    "abstractinglargegames.qmd"
    "pokersolvers.qmd"
    "aimath.qmd"
    "aifoundations.qmd"
    "recentaiadvances.qmd"
    "stateoftheartpokerai.qmd"
    "llms.qmd"
    "opponentmodeling.qmd"
    "aisafety.qmd"
    "theriver.qmd"
    "projectideas.qmd"
)

# Function to convert filename to title
filename_to_title() {
    echo "$1" | sed 's/\.qmd$//' | sed 's/\b\(.\)/\u\1/g' | sed 's/[A-Z]/ &/g' | sed 's/^ //'
}

# Create files
for file in "${parts[@]}"; do
    title=$(filename_to_title "$file")
    section=$(echo "$file" | sed 's/\.qmd$//')
    
    cat << EOF > "$file"
# $title {#sec-$section .unnumbered}

Hello

EOF
    echo "Created $file"
done

echo "All part files have been created."