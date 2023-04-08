+++
title = "ChatGPT: Looking into the Abyss"
author = ["Dr Ian Hocking"]
date = 2023-01-08
lastmod = 2023-01-08T11:05:32+00:00
tags = ["AI", "ML"]
draft = false
+++

I will always read an article by John Noughton, who is professor of the public understanding of technology at the Open University, where I worked a few years back teaching psychology. In [The ChatGPT bot is causing panic now - but it'll soon be as mundane a tool as Excel](https://www.theguardian.com/commentisfree/2023/jan/07/chatgpt-bot-excel-ai-chatbot-tech) he writes:

> at best, it’s an assistant, a tool that augments human capabilities.

Which I think is a good summary. However, he also linked to a paper by the AI researcher Murray Shanahan called [Talking About Large Language Models](https://arxiv.org/abs/2212.03551), as an 'antidote to [our] tendency to anthropomorphise systems such as ChatGPT'. This piqued my interest because anthropomorphism--the tendency to read human characteristics into things that ostensibly have none--cuts to the heart of our difficulty in understanding how to react to ChatGPT. I would argue that humans generally do exhibit anthropmorphism too much; but that isn't a reason to dismiss the notion that ChatGPT may be rather more human-like that people, including Shanahan, would be comfortable with.

What follows is a set of notes/marginalia on his paper. I don't present this as a particular critique, although I would like to see him consider these points in more detail. At the close of the paper he thanks several reviewers for 'robust' discussion; I wonder how this discussion went.

Remember that ChatGPT is a large language model. It uses a transformer architecture, which, unlike traditional connectionist architectures, and others, is somewhat more difficult to look inside when we want to know how it is making prediction decisions.

Murray begins:

> ...it is a serious mistake to unreflectingly apply to AI systems the same intuitions that we deploy in our dealings with each other, especially when those systems are so profoundly different from humans in their underlying operation. (p 1, para 4)

True enough. But are there many people who do this unreflectingly? He is attacking a straw man here.

He continues:

> To ensure that we can make informed decisions about the trustworthiness and safety of the AI systems we deploy, it is advisable to keep to the fore the way those systems actually work, and thereby to avoid imputing to them capacities they lack, while making the best use of the remarkable capabilities they genuinely possess. (p 1, para 5)

I wonder whether the capacities we naturally impute to other people--not machines--such as free will are present in these other people. Yes, free will sounds like something we all obviously possess, but this is not so obvious to many philosophers who have considered it. It may also seem obvious to us that other people have meaningful internal lives, but this notion can lead to difficulties when studied further, too.

He continues:

> [our] language-involving activity makes sense because we inhabit a world we share with other language users. (p 2, para 1)

This is true enough. However, Murray seems to want this only for ourselves, when it may be that ChatGPT exists in a world with other language users.

He writes:

> [large language models] are generative mathematical models of the statistical distribution of tokens in the vast public corpus of human-generated text, where the tokens in question include words, parts of words, or individual characters including punctuation marks. They are generative because we can sample from them, which means we can ask them questions. But the questions are of the following very specific kind. “Here’s a fragment of text. Tell me how this fragment might go on. According to your model of the statistics of human language, what words are likely to come next?” (p 2, para 2)

This is a clear summary. However, there are two things here that might be conflated. First, despite the vast the corpus used to train the model, it is relatively poor (in type) compared to the corpus to which a child is exposed (and, remember, a child can operate contingently on its environment to test its own language model; plus, adults will adapt themselves to assisting this endeavour). This is clearly a limitation. Second, Murray considers the prediction task to be a trivialisation of how humans acquire language, and this is not necessarily the case. Humans may well be born with some language rules; but we already know that prediction-based models (going back to early research in simple recurrent networks) can require of themselves a growing knowledge of grammar or language use as their way of improving performance on the prediction task. Prediction--the urge to reduce surprise, to harmonise oneself internally with one's environment--may well be at the heart of language acquisition.

More on anthropomorphism:

> It is perfectly natural to use anthropomorphic language in everyday conversations about artefacts, especially in the context of information technology. We do it all the time. My watch doesn’t realise we’re on daylight saving time. My phone thinks we’re in the car park. (p 3, para 1)

Murray goes on to identify this as the `intentional stance` tendency. However, while we might agree that ascribing intentionality to a watch stretches what we mean by intentionality (for me, this is a system that contains, in some sense, 'meaning'), it can also be fruitful to ask whether even more complex systems--such as the human brain, or the models of reality running within it--are themselves intentional. Many people, who have thought about this, believe that ascribing intentionality to brains is problematic because it tends to boil down the brain needing a special substance to 'house' the meaning, which is clearly a shaky argument.

Murray then makes a comment that I find difficult to follow:

> To be clear, it is not the argument of this paper that a system based on a large language model could never, in principle, warrant description in terms of beliefs, intentions, reason, etc. Nor does the paper advocate any particular account of belief, of intention, or of any other philosophically contentious concept. (p 3, para 3)

It seems to me that, with his narrow definition of 'knowledge' and 'belief' as 'things that human brains do' (I'm paraphrasing), it is difficult to see how a language model could ever be described as having a belief, given this. And his paper is certainly advocating a particular account of 'belief' etc. -- it is an account that requires these things to be special, limited to something that brains do (for some reason), and perhaps even limited to higher mammalian brains. (The crows would like to have a word, and perhaps some octopuses.)

Continuing with his theme of the specialness of humans, he writes:

> Humans are the natural home of talk of beliefs and the like, and the behavioural expectations that go hand-in-hand with such talk are grounded in our mutual understanding, which is itself the product of a common evolutionary heritage. (p 6, para 6)

This is difficult to justify. Why are human brains the natural home of beliefs? Why can't a model that arrives at similar representations have the same privilege?

It was a thoughtful paper, which goes on to say much more than I've commented on here (and I've made many more scrawlings on the paper copy that I've put into this post). Murray rightly points out that ChatGPT has not learned through environmental interaction; this is one of the aspects of the problem of embodiment. Is this a true limitation of this class of model, however? Is it an impossibility or an engineering problem, even if very difficult? If ChatGPT shows us one thing, it's that very difficult engineering problems can be solved, and when they are, they present us with equally difficult questions about our own special place in the universe.
