##putting together an example for the preprocessing steps

from BeautifulSoup import BeautifulSoup
from urllib import urlopen
import re, os

url  = urlopen('http://avalon.law.yale.edu/19th_century/gettyb.asp').read()


soup = BeautifulSoup(url)


text = soup.p.contents[0]


text_1 = text.lower()


text_2 = re.sub('\W', ' ', text_1)



from nltk import word_tokenize
from nltk import bigrams
from nltk import trigrams

text_3 = word_tokenize(text_2)

text_3_bi = bigrams(text_3)
text_3_tri = trigrams(text_3)
text_3_n = ngrams(text_3, 4)



stop_words = urlopen('http://jmlr.org/papers/volume5/lewis04a/a11-smart-stop-list/english.stop').read().split('\n')

##we can then identify the stop words and then eliminate them from the list

##this is code that executes a very simple for loop to check the list
text_4 = [x for x in text_3 if x not in stop_words]

##you can check what was removed with:

text_rem = [x for x in text_3 if x not in text_4]

##we're going to use a similar format to apply various stemming/lemmatizing/synonyms algorithms


from nltk.stem.lancaster import LancasterStemmer

st = LancasterStemmer()



from nltk.stem import PorterStemmer

pt = PorterStemmer()


from nltk.stem.snowball import EnglishStemmer

sb = EnglishStemmer()


from nltk.stem.wordnet import WordNetLemmatizer

wn = WordNetLemmatizer()


##let's examine the word ``better"
st.stem('better')
pt.stem('better')
sb.stem('better')

wn.lemmatize('better', 'a')

##
##applying the porter stemmer to the gettysburg address


text_5 = map(pt.stem, text_4)

##now creating a dictionary that will count the occurrence of the words

getty = {}
used = []
for word in text_5:
	if word in getty:
		getty[word] += 1 
	if word not in getty and word not in used:
		getty[word] = 1
		used.append(word)

getty_count = getty.values()
getty_keys = getty.keys()


rfile = open('/users/justingrimmer/dropbox/teaching/text/tad14/class3/GettysburgFinal.txt', 'w')
rfile.write('stem, count')
rfile.write('\n')

for j in range(len(getty_keys)):
	rfile.write('%s,%s' %(getty_keys[j], getty_count[j]))
	rfile.write('\n')


rfile.close()	


##position it so that it creates a document
dtm = open('/users/justingrimmer/dropbox/teaching/text/tad14/class3/GettysburgFinalDTM.txt', 'w')

getty_words = 'Document'
getty_numbers = 'Address'
for m in range(len(getty_keys)):
	getty_words += ','
	getty_words += getty_keys[m]
	getty_numbers += ','
	getty_numbers += str(getty_count[m])



dtm.write(getty_words)
dtm.write('\n')
dtm.write(getty_numbers)


for m in range(len(getty_keys)):
	dtm.write(getty_keys[m])
	dtm.write(',')
dtm.write('\n')
dtm.write('address')

for m in range(len(getty_count)):
	dtm.write(getty_count[m])
	dtm.write(',')

dtm.write('\n')

dtm.close()
























##let's work with text


