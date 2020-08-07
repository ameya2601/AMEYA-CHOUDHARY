sms = read.csv("D:\\DATA VISUALISATION AND ANALYTICS\\DATA SCIENCE R ASSIGNMENTS\\Naive bayes\\sms_raw_NB.csv", stringsAsFactors=F)
str(sms)
round(prop.table(table(sms$type))*100, digits = 1)

sms$type = factor(sms$type)
#  ham spam 
## 86.6 13.4

sms$type = factor(sms$type)

library(tm)
sms_corpus = Corpus(VectorSource(sms$text))
print(sms_corpus)

#Metadata:  corpus specific: 1, document level (indexed): 0
#Content:  documents: 5559

inspect(sms_corpus[1:3])

#clean
corpus_clean = tm_map(sms_corpus, tolower)                    # convert to lower case
corpus_clean = tm_map(corpus_clean, removeNumbers)            # remove digits
corpus_clean = tm_map(corpus_clean, removeWords, stopwords()) # and but or you etc
corpus_clean = tm_map(corpus_clean, removePunctuation)        # you'll never guess!
corpus_clean = tm_map(corpus_clean, stripWhitespace)          # reduces w/s to 1
inspect(corpus_clean[1:3])

#corpus_clean = tm_map(corpus_clean, PlainTextDocument)
dtm <- DocumentTermMatrix(corpus_clean)
str(dtm)

sms.train = sms[1:4200, ] # about 75%
sms.test  = sms[4201:5574, ] # the rest

dtm.train = dtm[1:4200, ]
dtm.test  = dtm[4201:5574, ]

# and finally the corpus
corpus.train = corpus_clean[1:4200]
corpus.test  = corpus_clean[4201:5500]

# let's just assert that our split is reasonable: raw data should have about 87% ham
# in both training and test sets:
round(prop.table(table(sms.train$type))*100)


Training and evaluating our model

#install.packages("e1071")
library(e1071)
# store our model in sms_classifier
sms_classifier = naiveBayes(sms.train, sms.train$type)
sms_test.predicted = predict(sms_classifier,
                             sms.test)
library(gmodels)
CrossTable(sms_test.predicted,
           sms.test$type,
           prop.chisq = FALSE, # as before
           prop.t     = FALSE, # eliminate cell proprtions
           dnn        = c("predicted", "actual")) # relabels rows+cols
