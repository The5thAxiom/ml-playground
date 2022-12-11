counts = read.delim(
    'stripped-counts',
    sep=" ",
    col.names=c('Count', 'Word')
)
counts = cbind(
    counts,
    Initial.letter=substr(counts$Word, 1, 1)
)
summary(counts)

library(ggplot2)

head(counts[order(counts$Count, decreasing=TRUE),], n=20)

ggplot(
    head(counts[order(counts$Count, decreasing=TRUE),], n=20),
    aes(
        x=factor(Word, levels = Word[order(Count, decreasing=TRUE)]),
        y=Count,
        fill=Initial.letter
    )
) + geom_col() + labs(
    title="The Top-20 Most-Frequent Words in Sherlock Holmes",
    x="Word",
    y="Frequency"
)