###loading the mallet objects
##topics are indexed 



mallet.topics<- function(file, num_topics){
	start<- read.delim(file, header=F, sep =' ', row.names=NULL)
	start<- start[-1,]
	store.props<- matrix(NA, nrow=nrow(start), ncol=num_topics)
	seq1<- seq(3, 2*num_topics + 2, by = 2)
	seq2<- seq(4, 2*num_topics + 2, by = 2)
	for(z in 1:nrow(start)){
		for(k in 1:num_topics){
			store.props[z,as.numeric(as.character(start[z,seq1[k]])) +1]<- as.numeric(as.character(start[z, seq2[k]]))
			}
		}
	
	rownames(store.props)<- as.character(start[,2])
	return(store.props)
	}	
		

flake_tops<- mallet.topics('/users/justingrimmer/dropbox/teaching/text/tad14/class11/FlakeExample_Topics', 3)

##now extracting the keys

mallet.keys<- function(file, num_topics){
	start<- read.delim(file, header=F, sep=' ', row.names=NULL)
	keys<- matrix(NA, nrow=num_topics, ncol=10)
	props<- c()
	for(z in 1:num_topics){
		ff<- strsplit(as.character(start[z,1]), split='\t')
		props[z]<- as.character(ff[[1]][2])
		keys[z,1]<- as.character(ff[[1]][3])
		for(g in 2:10){
		keys[z,g]<- as.character(start[z,g])
	}
	}
	keys_prop<- cbind(props, keys)
	return(keys_prop)
	}

flake_keys<- mallet.keys('/users/justingrimmer/dropbox/teaching/text/tad14/class11/FlakeExample_keys', 3)


flake_tops_20<- mallet.topics('/users/justingrimmer/dropbox/teaching/text/tad14/class11/FlakeExample_Topics_20', 20)
flake_keys_20<- mallet.keys('/users/justingrimmer/dropbox/teaching/text/tad14/class11/FlakeExample_keys_20', 20)

