import json
x = {"established": ["established"], \
"major": ["major"], \
"love": ["love"], \
"won": ["won"], \
"power": ["power"], \
"national": ["national"], \
"democrat": ["democratic", "democrat"], \
"republican": ["republican"], \
"elected": ["elected"], \
"taught": ["taught"], \
"black": ["black", "african-american"], \
"social": ["social"], \
"religion": ["god", "gods", "religious", "religion", "jewish", "judaism", "christian", "christianity", "muslim", "islam", "buddhist", "buddhism", "hinduism", "hindu"], \
"book": ["book", "books"], \
"career": ["career"], \
"award": ["award"], \
"interest": ["interest"], \
"action": ["action", "active"], \
"culture": ["culture", "cultural"], \
"important": ["important"], \
"leadership": ["leader", "administrator", "executive", "chair", "director", "president", "chairwoman", "chairman"], \
"acting": ["actress", "actor", "thespian", "film", "theater", "broadway", "television"], \
"academia": ["professor", "faculty", "lecturer", "emeritus", "doctorate", "institute"], \
"teaching": ["teacher", "schoolteacher"], \
"law": ["lawyer", "attorney", "defender", "judge"], \
"science": ["science", "scientist", "research", "scientific", "sciences", "scientists", "engineer", "engineering"], \
"fashion": ["fashion"], \
"music": ["musician", "composer", "pianist", "opera", "orchestra", "singer", "sang", "symphony", "conductor", "musical"], \
"visual arts" : ["artist", "painter", "photographer", "painted", "sculptor", "curator", "architect", "illustrator"], \
"literature" : ["editor", "publisher", "writer", "author", "novelist", "novel", "novels", "book", "books", "literary", "literature", "poetry", "poet"], \
"journalism": ["reporter", "journalist", "columnist"], \
"politics": ["congress", "congresswoman", "congressman", "politics", "political", "government", "minister"], \
"business": ["business", "company", "corporation", "finance"], \
"dance": ["dancer", "dance", "ballet", "choreographer"], \
"military": ["military", "army", "navy"], \
"sports": ['team', 'league', 'football', 'soccor', 'hockey', 'tennis', 'golf', 'wrestling', 'baseball', 'basketball', 'olympic', 'olympics'], \
"family": ["family"], \
"son": ["son", "sons"], \
"daughter": ["daughter, daughters"], \
"children": ["children"], \
"grandchildren": ["grandchildren", "grandchild", "granddaughter", "grandson"], \
"wife": ["wife"], \
"husband": ["husband"], \
"marriage": ["married", "marry", "marriage"], \
"divorce": ["divorce", "divorced", "divorcing"], \
"father": ["father"], \
"mother": ["mother"], \
"friend": ["friend"], \
"brother": ["brother", "brothers"], \
"sister": ["sister", "sisters"] }

print json.dumps(x)
