"Coffee" by Bastian Krol

The story headline is "A small piece of interactive fiction".
The story genre is "Slice of Life".
The story description is "The hardships of working from home: How difficult can it be to get to your desk and start to be productive?".
The story creation year is 2012.
Release along with an interpreter.
Release along with cover art.
[TODO Cover art copyright by Moyan Brenn. Go to http://www.flickr.com/aigle_dore to see more of his work.]
Release along with the private source text.

Include Basic Screen Effects by Emily Short.
Include Basic Help Menu by Emily Short.
Include Hiding Under by Eric Eve.
Include Plugs and Sockets by Sean Turner. 
[Include Simple Unit Tests by Dannii Willis.]

[
NEXT TODOs:
* Proof reading.
* Playtesting.
* Publish to beta testers.
* Write a decent unit test extension or check if the two existing ones could do.
]

Chapter Rules

Section Misc Rules

The maximum score is 21.

A window is a kind of thing.
Instead of opening a window:
	say "Rather not. It's probably -8° C outside."

Instead of sleeping:
	if the player is on the bed or the player is on the sofa:
		say "Yes, very tempting idea. But you need to get some work done.";
	otherwise:
		say "While standing?"

Section Start

When play begins:
	say "(If you are new to interactive fiction, you might want to type 'help' before starting to play to learn the basics of this type of game.)";
	say paragraph break;
	say "The shrill beep of the alarm clock wakes you up from a beautiful dream you can only vaguely remember. You barely manage to hit the button to switch the alarm off, groaning. You are extremely tired. You knew you had to pay the price when you went to bed that late yesterday evening, and you also knew that you had to get up early today because there is a lot of work to do. You still need to finish a number of things and the deadline is this evening.";
	say line break;
	say "Well, anyway. You will be working from home today and all you have to do is getting to your desk in your home office room and start being productive.".

Section Disambiguation

Does the player mean doing anything to a power-plug-kind: it is very unlikely.

Does the player mean doing anything to the cup: it is very likely. [also referred to as "coffee"]

Does the player mean doing anything to the coffee machine's button: it is possible.
Does the player mean doing anything to the laptop's power button: it is unlikely.

Does the player mean doing anything to the coffee machine: it is likely.

Does the player mean doing anything to the coffee machine's power cord: it is very unlikely.
Does the player mean doing anything to the toaster's power cord: it is very unlikely.

Does the player mean doing anything to the pack of toast: it is unlikely.

Does the player mean inserting the untoasted piece of toast into the toaster: it is very likely.
Does the player mean inserting the toasted piece of toast into the toaster: it is unlikely.
Does the player mean inserting a toast-kind into the toaster when the noun is in the toaster: it is very unlikely.
Does the player mean inserting the charred piece of toast into the toaster: it is very unlikely.

Does the player mean eating the toasted piece of toast: it is likely.
Does the player mean eating the untoasted piece of toast: it is possible.
Does the player mean eating the charred piece of toast: it is unlikely.

[
Possible values:
it is very likely 
it is likely 
it is possible  - DEFAULT
it is unlikely 
it is very unlikely 
]

Section Electricity

A power-plug-kind is a kind of PS-plug. The type of a power-plug-kind is "power".
A power-socket-kind is a kind of PS-socket. The type of a power-socket-kind is "power".

A power-supply-plug-kind is a kind of PS-plug. The type of a power-supply-plug-kind is "power-supply".
A power-supply-socket-kind is a kind of PS-socket. The type of a power-supply-socket-kind is "power-supply".

A power cord is a kind of thing.

An electric device is a kind of container. [Why a container? Because two of them, toaster and coffee machine can have put things into them.] Every electric device incorporates a power-plug-kind. Every electric device incorporates a power cord.

Instead of plugging a power cord into something:
	repeat with parent running through the electric devices which incorporate the noun:
		try plugging parent into the second noun.

A power source is a kind of thing.
A wall-outlet-kind is a kind of power source. A wall-outlet-kind is fixed in place. Every wall-outlet-kind incorporates a power-socket-kind.
A double-wall-outlet-kind is a kind of power source. A double-wall-outlet-kind is fixed in place. Every double-wall-outlet-kind incorporates two power-socket-kinds.

To decide if the (item - a thing) is powered:
	repeat with plug running through the PS-plugs which are part of the item:
		if the attachment of the plug is not nothing:
			decide yes;
	decide no.

Section Laptop In Kitchen

To decide if the laptop is laptop-powered:
	unless the floor lamp's power plug is powered:
		decide no;
	unless the floor lamp's power plug is a part of the power supply:
		decide no;
	unless the power supply is powered:
		decide no;
	decide yes.

Instead of pushing the laptop's power button:
	unless the laptop is laptop-powered:
		say "Nothing happens. The laptop's battery is still empty, it seems.";
	otherwise:
		say "The laptop boots up. You start to work but after a few minutes you realize that working standing at the kitchen counter is not very convenient. You should really take your stuff to the office room and work there. Annoyed, you switch off the laptop."

Section Water Handling

The cup is a thing.
The cup is either empty or full-of-coffee or full-of-water.
Understand "coffee" as cup when the cup is full-of-coffee.
Understand "water" as cup when the cup is full-of-water.
The cup is empty.

The description of the cup is "The cup you usually use for your morning coffee[if the cup is full-of-coffee]. There is some steaming black coffee in it[otherwise if the cup is full-of-water]. There is some water in it[otherwise]. To your disappointment, it is empty[end if]."
The printed name of the cup is "[if the cup is full-of-coffee]cup of coffee[otherwise if the cup is full-of-water]cup with water[otherwise]cup[end if]"

The watertank is part of the coffee machine. 

The watertank has a number called the capacity. The capacity of the watertank is 15.
The watertank has a number called the fill-level. The fill-level of the watertank is 0.
To decide if the watertank is empty:
	if the fill-level of the watertank is 0:
		decide yes;
	decide no.
To decide if the watertank is full:
	if the fill-level of the watertank >= the capacity of the watertank:
		decide yes;
	decide no.

The description of the watertank is "[if watertank is full]The watertank is full[otherwise if the watertank is empty]The watertank is empty[otherwise]There is some water in the watertank, the water level reaches up to a line labelled [the fill-level of the watertank][end if]."

Instead of inserting something into the sink:
	if the noun is the watertank:
		if the cup is in the sink:
			say "There is already the cup in the sink. The sink is too small to put both the watertank and the cup into it at the same time.";
		otherwise:
			continue the action;
	otherwise if the noun is the cup:
		if the watertank is in the sink:
			say "There is already the watertank in the sink. The sink is too small to put both the watertank and the cup into it at the same time.";
		otherwise:
			continue the action;
	otherwise:
		say "You would achieve nothing by this."

After switching on the tap:
	if the watertank is in the sink:
		say "The water starts to flow into the watertank. It is full now.";
	otherwise if the cup is in the sink:
		if the cup is full-of-coffee:
			say "The water starts to flow into the cup, replacing the coffee in it. It is full of water now.";
		otherwise:
			say "The water starts to flow into the cup. It is full now.";
	otherwise:
		say "The water starts to flow into the sink."

After inserting the watertank into the sink:
	say "You put the watertank into the sink.";
	if the tap is switched on:
		say "The water from the tap fills the watertank."

After inserting the cup into the sink:
	say "You put the cup into the sink.";
	if the tap is switched on:
		if the cup is full-of-coffee:
			say "The water from the tap fills the cup and replaces the coffee that was in it.";
		otherwise:
			say "The water from the tap fills the cup."

After switching off the tap:
	say "The water stops flowing."

Every turn:
	if the tap is switched on and the watertank is in the sink:
		now the fill-level of the watertank is the capacity of the watertank;
	if the tap is switched on and the cup is in the sink:
		now the cup is full-of-water.

Section Pouring

Emptying it into is an action applying to two things.
understand "empty [something] in/into [something]" as emptying it into.
understand "pour [something] in/into [something]" as emptying it into.
Instead of inserting the cup into the watertank:
	try emptying the cup into the watertank.
Instead of emptying the cup into the coffee machine:
	try emptying the cup into the watertank.

Check emptying something into something:
	if the noun is not the cup:
		say "You cannot empty the [noun] into the [second noun]." instead;
	if the second noun is not the watertank and the second noun is not the sink:
		say "You cannot empty the [noun] into the [second noun]." instead;
	if the cup is empty:
		say "But the cup is empty." instead;
	if the second noun is the watertank and the cup is full-of-coffee:
		say "You should not fill coffee into the watertank, it would probably break the machine." instead;
	if the second noun is the watertank and the watertank is full:
		say "The watertank is already full." instead.

Carry out emptying something into something:
	now the cup is empty;
	if the second noun is the watertank:
		increment the fill-level of the watertank.

Report emptying something into something:
	if the second noun is the watertank:
		say "You pour the water from the cup into the watertank.";
	otherwise if the second noun is the sink:
		say "You pour the content of the cup into the sink. Now the cup is empty again.";

Section Making Coffee

has-made-mess is a truth state that varies.

Instead of inserting something into the coffee machine: 
	if the noun is the cup:
		continue the action;
	otherwise if the noun is the watertank:
		try tying the watertank to the coffee machine;
	otherwise:
		say "You would achieve nothing by this."

The coffee machine's button is part of the coffee machine.
The display-text is a text that varies.
The display-text is "'READY'".

Every turn:
	if the coffee machine is powered:
		unless the watertank is part of the coffee machine:
			now the display-text is "WATERTANK MISSING";
		otherwise unless the watertank is full:
			now the display-text is "'WATERTANK EMPTY'";
		otherwise:
			now the display-text is "'READY'";
	otherwise:
		now the display-text is "";

Instead of taking the watertank:
	if the watertank is visible and the watertank is part of the coffee machine:
		now the watertank is carried by the player;
		say "Taken.";
	otherwise:
		continue the action.

Instead of tying the watertank to the coffee machine:
	say "You put the watertank back into the coffee machine.";
	now the watertank is part of the coffee machine.

Instead of pushing the coffee machine's button:
	unless the coffee machine is powered:
		say "You push the button, but nothing happens. You notice that the display is unlit. Obviously the coffee machine has no power.";
	otherwise:
		if the watertank is not part of the coffee machine or the watertank is empty:
			say "The coffee machine emits a low, sad beep.";
		otherwise:
			say "The coffee machine emits a short, happy beep and begins its usual cacaphony off grinding and brewing noises.";
			unless the cup is in the coffee machine:
				say "A little later, a stream of hot, black coffee flows directly into the drip tray, where your cup should have been. It also spills on the kitchen counter. What a mess!";
				now has-made-mess is true;
			otherwise:
				if the cup is full-of-coffee:
					say "A little later, a stream of hot, black coffee flows into the cup, which had been full of coffee already. The coffee starts to flow over as more coffee pours into the cup, spilling all over the kitchen counter. What a mess!";
					now has-made-mess is true;
				otherwise:
					say "A little later, a stream of hot, black coffee flows into the cup. The crema on top just looks delicious.";
					now the cup is full-of-coffee.

[
TODO More stuff for an even more intricate make-coffee-puzzle:

* Add "COF. BEANS EMPTY"?
  - Find pack of beans in cupboard
  - But how to model the bean container? No, just "put beans into coffee machine". OTOH, that really doesn't add any value.
* Alternative way of getting water into the tank?
    - find a cup (on table), put cup in sink, turn on water tap, turn off water tap, get cup, pour water from cup into cm/watertank, do that 3 times
]

Section Caffeine Intake

Sufficient caffeine saturation is a truth state that varies. Sufficient caffeine saturation is false.
The coffee counter is a number that varies. The coffee counter is 0.

coffeedrinking is an action applying to nothing.

Before drinking the cup:
	try coffeedrinking instead.

Check coffeedrinking:
	if the cup is empty:
		say "You sip a bit of thin air from the empty cup." instead;
	if the cup is full-of-water:
		say "You sip some water from the cup." instead;
	if coffee counter is 3:
		say "No, really, you had enough coffee for now. Too much caffeine ain't good for you." instead.

Carry out coffeedrinking:
	increment the coffee counter;
	now sufficient caffeine saturation is true;
	now the cup is empty;
	if the coffee counter is 1:
		if has-made-mess is true:
			increase the score by 3;
		otherwise:
			increase the score by 4.

Report coffeedrinking:
	if coffee counter is 0:
		[This should never happen]
		say "Oh, weird! This shouldn't have happened. Can you do that again, please.";
	otherwise if coffee counter is 1:
		say "Ahh. That was badly needed.";
		say "You notice that you are a little hungry. Breakfast would be nice.";
	otherwise if coffee counter is 2:
		say "Very tasty, indeed.";
	otherwise if coffee counter is 3:
		say "Mmh. Good. But I think three cups are enough for the morning, don't you think.";
	otherwise:
		[This should never happen]
		say "You have a bad feeling in your stomach. I think you had to much coffee already."
				
Section Making Breakfast

Breakfast state is a truth state that varies. Breakfast state is false.
Toast already eaten is a number  that varies.

A toast-kind is a kind of supporter. [It is a supporter to be able to put a slice of cheese on it.]
A toast-kind is portable and edible.
A toast-kind has a number called hotness. The hotness of a toast-kind is usually 0.
An untoasted piece of toast is a kind of toast-kind. The plural of untoasted piece of toast is untoasted pieces of toast. 
A toasted piece of toast is a kind of toast-kind. The plural of toasted piece of toast is toasted pieces of toast.
A charred piece of toast is a kind of toast-kind. The plural of charred piece of toast is charred pieces of toast.

A slice of cheese is a kind of thing. A slice of cheese is edible. The plural of slice of cheese is slices of cheese.
Instead of putting something that is not a slice of cheese on a toast-kind:
	say "That would not be very tasty.";
Instead of putting a slice of cheese on a toast-kind:
	now the noun is on the second noun;
	say "You put the [noun] on the [second noun].".

Check inserting something into the toaster:
	if the noun is not a toast-kind: 
		say "That would be a pretty bad idea." instead;
	if the number of toast-kinds in the toaster > 1:
		say "There are already two pieces of toast in the toaster. Another one would not fit into it." instead;
	if a slice of cheese is on the noun:
		say "You can't put the [noun] into the toaster while there is a slice of cheese on it." instead.
		
Report inserting a toast-kind into the toaster: 
	let t be number of toast-kinds in toaster;
	if t is 1:
		say "You put the [noun] into the first slot of the toaster.";
		rule succeeds;
	otherwise if t is 2:
		say "You put the [noun] into the second slot of the toaster.";
		rule succeeds;
	otherwise:
		[should not happen]
		say "You put the [noun] into the toaster.";
		rule succeeds;

Toast Limbo is a room. Ten toasted pieces of toast are here. Ten charred pieces of toast are here.

The lever is part of the toaster.
Understand "push down [something]" as pushing.
Understand "press down [something]" as pushing.

Instead of pushing the lever:
	unless the toaster is powered:
		say "You push the lever down, but it immediately snaps back upwards. ";
	otherwise:
		say "You push the lever down and the coils inside the toaster start to glow.";
		unless a toast-kind is in the toaster:
			say "A little while later, the lever of the toaster pops up again. If you had put a piece of toast into the toaster before activating it, you would have some tasty toasted piece of toast for breakfast by now.";
		otherwise:
			say "A little while later, the lever of the toaster pops up again and so does the toast.";
			let toasted-count be 0;
			repeat with piece-of-toast-in-toaster running through the toast-kinds which are in the toaster:
				increment toasted-count;
				let L be a list of text;
				if number of toast-kinds in toaster is 2:
					if toasted-count is 2:
						let L be {"The second toast", "the second toast"}; 
					otherwise:
						let L be {"The first toast", "the first toast"}; 
				otherwise: [only one piece of toast in toaster]
					let L be {"It", "it"}; 
				if the piece-of-toast-in-toaster is an untoasted piece of toast:
					remove the piece-of-toast-in-toaster from play;
					let new piece be a random toasted piece of toast in Toast Limbo; 
					now new piece is in the toaster;
					now hotness of the new piece is 5;
					say "[entry 1 of L] has been toasted to a tasty looking light golden brown.";
				otherwise if the piece-of-toast-in-toaster is a toasted piece of toast:
					remove the piece-of-toast-in-toaster from play;
					let new piece be a random charred piece of toast in Toast Limbo; 
					now new piece is in the toaster;
					now hotness of the new piece is 5;
					say "Since it had already been toasted before, [entry 2 of L] is has been charred to an inedible black, hard something now.";
				otherwise: [toast had been charred before]
					now hotness of the piece-of-toast-in-toaster is 5;
					say "[entry 1 of L] had been charred black even before you put it in the toaster. It seems toasting it again did not make much of a difference - except that there is an unpleasent burnt smell in the kitchen now."

Before eating an untoasted piece of toast:
	say "It is not toasted yet." instead;
Before eating a charred piece of toast:
	say "No way. It has been toasted at least one time too often." instead.

After eating a toasted piece of toast:
	remove the noun from play;
	now breakfast state is true;
	increment toast already eaten;
	if toast already eaten is 1:
		if a slice of cheese is on the noun:
			say "Toast with cheese for breakfast, that's not too bad. You do not feel hungry anymore.";
			increase the score by 3;
		otherwise:
			say "Dry toast - not exactly a treat. But you do not feel hungry anymore and if nothing else is available, this may count as breakfast.";
			increase the score by 2;
	otherwise:
		if a slice of cheese is on the noun:
			say "You're not really hungry anymore but you nibble the toast with cheese nonetheless.";
		otherwise:
			say "You're not really hungry anymore but you nibble the dry toast nonetheless."

Instead of examining a toast-kind:
	if the noun is hot:
		say "The [noun] seems to be pretty hot.";
	otherwise if the noun is warm:
		say "The [noun] is still quite warm.";
	otherwise:
		continue the action.

Instead of taking a toast-kind:
	if the noun is hot:
		say "You grab the toast but it is still too hot to handle and you drop it accidentally to the flloor. Considering how long it has been since you last cleaned your kitchen floor, you decide that you would rather not eat this piece of toast. You throw it away immediately.";
		now the noun is off-stage; [todo: model waste bin and put the noun there]
	otherwise:
		continue the action.

To decide if (t - a toast-kind) is hot:
	if the hotness of t >= 3:
		decide yes;
	otherwise:
		decide no.
To decide if (t - a toast-kind) is warm:
	if the hotness of t >= 1:
		decide yes;
	otherwise:
		decide no.

Every turn:
	repeat with t running through all toast-kinds:
		if the hotness of t > 0:
			decrement the hotness of t.


[
TODO Optional: After eating and after drinking coffee: If both are true: "After having coffee and breakfast your headache slowly recedes. You don't exactly feel energetic but you think you are as ready for work as you will get today.
]

Section Cutting Things

Understand "cut [something] with [something]" as cutting it with.
Instead of cutting something:
	if the player is carrying the knife:
		say "(with the knife)";
		try cutting the noun with the knife;
	otherwise:
		say "You have nothing to cut it with.".

Cutting it with is an action applying to two things.
Check cutting it with: 
    if the noun is a person, say "That would hurt." instead; 
    if the second noun is not the knife, say "You can't cut things with [the second noun]." instead.

Carry out cutting it with: 
    do nothing.

Report cutting it with:
	say "You slash [the noun] with [the second noun]. It doesn't seem to have much effect, though."

Instead of cutting the lamp's power cord with the knife:
	if the floor lamp's power plug is part of the floor lamp's power cord:
		say "You cut of the power plug from the power cord of the old lamp.";
		now the the floor lamp's power plug is in the living room;
		increase the score by 2;
	otherwise:
		say "You already cut the power plug from the power cord, you would achieve nothing by cutting it even more."
Instead of cutting the floor lamp with the knife:
	try cutting the floor lamp's power cord with the knife;
Instead of cutting the floor lamp's power plug with the knife:
	try cutting the floor lamp's power cord with the knife.

Instead of cutting the toaster's power cord with the knife:
	say "But that would destroy the toaster! How would you make toast then?"
Instead of cutting the toaster with the knife:
	try cutting the toaster's power cord with the knife instead.
Instead of cutting the coffee machine's power cord with the knife:
	say "But that would destroy the coffee machine! How would you make coffee then?"
Instead of cutting the coffee machine with the knife:
	try cutting the coffee machine's power cord with the knife instead.

Instead of cutting a toast-kind with the knife:
	say "That would not help much.".
Instead of cutting a toasted piece of toast with the knife:
	say "No need to. You could eat it, though.".

Section Broken Things And Fixing

A thing is either broken or not broken. A thing is usually not broken.

[tie/attach/connect]
Understand "connect [something] to [something]" as tying it to.

Instead of tying the power plug to the power supply:
	if the player carries the power supply and the power plug is part of the power supply:
		say "It seems you already did that, remember?";
		stop the action;
	if the player does not carry the power plug or the player does not carry the power supply:
		say "For that, you obviously would need to hold both in your hands.";
		stop the action;
	if the power plug is powered:
		say "You fumble and and twiddle with the stranded wires while the power plug is plugged into a wall outlet. Not your best idea today. You don't even feel the electric shock before dropping to the floor.";
		end the story saying "You have died.";
		stop the action;
	now the power plug is part of the power supply; 
	say "You fumble and and twiddle with the stranded wires but finally manage to connect each of the wires from the power plug to the corresponding wire of the broken power cord of the power supply. Lacking proper tools for the job you just twist them together but it seems to hold well enough for now, if you handle it carefully. Luckily, each wire still has a bit of colored insulation so it's easy to figure out which connections need to be made.";
	now the power supply is not broken;
	increase score by 1.

Instead of tying the power supply to the power plug:
	try tying the power plug to the power supply.

Instead of taking the power plug when power plug is part of the power supply:
	say "You want do disconnect the wires again? No way."

power-supply-hint-already-given is a truth state that varies.
To maybe-give-hint-for-power-supply-puzzle:
	if power-supply-hint-already-given is false and player carries the power supply and player carries the power plug:
		say "[line break]Hmm... now you have a power supply which misses a power plug and you have a power plug. I wonder if these two can somehow be connected.";
		now power-supply-hint-already-given is true.

Section Oral Hygiene

The toothbrush and the toothpaste are things.
The toothpaste is either open or closed.
The toothpaste is closed.
Instead of opening the toothpaste:
	if the toothpaste is closed:
		now the toothpaste is open;
		say "You open the toothpaste.";
	otherwise:
		say "It's already opened."
Instead of closing the toothpaste:
	if the toothpaste is open:
		now the toothpaste is closed;
		say "You close the toothpaste.";
	otherwise:
		say "It's already closed."

The toothbrush can be either toothpasted or clean.
The toothbrush is clean.
The toothpaste can be put on the toothbrush.
Before putting the toothpaste on the toothbrush:
	if the toothpaste is not open:
		try opening the toothpaste;
	if toothbrush is toothpasted:
		say "There is already some toothpaste on it.";
		stop the action.
Instead of putting the toothpaste on the toothbrush:
	now the toothbrush is toothpasted;
	say "You put some toothpaste on the toothbrush."

Toothbrushing is an action applying to nothing.
A person can be either toothbrushed or foul-mouthed.
The player is foul-mouthed.
Understand "brush teeth" as toothbrushing.
Understand "toothbrush" as toothbrushing.
Understand "brush my teeth" as toothbrushing.
Understand "brush your teeth" as toothbrushing.
Understand "put toothbrush in mouth" as toothbrushing.
Check toothbrushing:
	if the toothbrush is not visible:
		say "You can hardly brush you teeth without a toothbrush, now can you?" instead;
	if the player is toothbrushed:
		say "I believe your teeth are as clean as they can get." instead;
	if the toothbrush is not toothpasted:
		say "Maybe you should put toothpaste on the toothbrush before." instead.
Carry out toothbrushing:
	if the player is foul-mouthed:
		increase the score by 2;
	now the player is toothbrushed.
Report toothbrushing:
	say "Now your teeth are all shiny.";
	say "[line break](By the way, this was an optional puzzle. But it's nice to see that you care about oral hygiene. Keep up the good work.)".
Before toothbrushing:
	if player is not carrying the toothbrush and the toothbrush is visible:
		say "(First taking the toothbrush)";
		try silently taking the toothbrush.

Section Rules For Entering The Office

Before going to the Office:
	if sufficient caffeine saturation is false:
		say "Start working now?!? You definitely need a coffee first! Otherwise you'll probably fall asleep as soon as you sit down at your desk. You'll better come here again when you are ready to work.";
		stop the action.
Before going to the Office:
	if breakfast state is false:
		say "You think it's about time to start working? But you didn't even have breakfast. You already feel a little hungry and it will be worse soon. You will not be able to concentrate and do anything useful. Besides, starting to work now and stopping for breakfast in half an hour will only interrupt your flow. You'll better come here again when you are ready to work.";
		stop the action.
Before going to the Office:
	if the player is not carrying the laptop:
		say "Yes, you should really start working now. Um, but on the other hand, what would you want to do in the office without your laptop, anyway? No use sitting at your desk without the proper equipment. You'll better come here again when you are ready to work.";
		stop the action.
Before going to the Office:
	if the player is not carrying the power supply:
		say "Yes, you should really start working now. Okay, let's see. You have your laptop, that's fine. But its battery seems to be completely empty so you better search for the power supply first. No use sitting at your desk without the proper equipment. You'll better come here again when you are ready to work.";
		stop the action.
Before going to the Office:
	if the the power supply is broken:
		say "Yes, you should really start working now. Okay, let's see. You have your laptop and the power supply. But the power supply is still not in a usable state, and the battery of the laptop seems to be completely empty. You need to do something about the broken power supply and the missing power plug before actually starting to work. You'll better come here again when you have taken care of this.";
		maybe-give-hint-for-power-supply-puzzle;
		stop the action.
 
 After going to the Office:
	increase score by 5;
	say "You enter your office and finally sit down at your desk, plug the power plug (that once belonged to the old floor lamp) into the wall outlet and connect the power supply to your laptop. Your improvised power cord makes gentle frizzling noises now and then but it seems to work. The first thing you do is to order a proper replacement for it online. You feel energetic and start to type away, soon completely immersed in your work.";
	end the story finally saying "You have won".

Section Help

Table of Basic Help Options (continued)
title	description 
"Credits"								"Cover art copyright by Moyan Brenn. Go to http://www.flickr.com/aigle_dore to see more of his work."
"Contacting the Author"	"If you have any difficulties with [story title], please contact me at firstname.lastname@web.de (replace firstname with bastian and lastname with krol)." 

[TODO Check with Moyan Brenn if this is okay. The link is not clickable, as it should be. Maybe that can be put on the website, somehow. Contact him anyway.]

When play begins:
	choose row 1 in Table of Basic Help Options;
	now description entry is "
'Coffee' - a small piece of interactive fiction

The hardships of working from home: How difficult can it be to get to your desk and start to be productive?
	
The story of 'Coffee' takes place in your flat. The goal of this game is quite simple: Get into your home office room and start to work. While this sounds very simple, you will find that there are a number of obstacles in your way.

If you have never played interactive fiction before, you should also check out the section 'Instructions for Play', which gives you a basic introduction to this genre."

Section Magic

Understand "xyzzy" or "say xyzzy" or "cast xyzzy" as casting xyzzy. 

Casting xyzzy is an action applying to nothing. 

has-said-xyzzy is a truth state that varies.
Check casting xyzzy:
	if has-said-xyzzy is true:
		say "No, rather not. To be honest, you are quite afraid of what might happen. One time is enough." instead.
Carry out casting xyzzy:
	now has-said-xyzzy is true;
	say "Your vision begins to blur. The electric light starts to flicker and shadows leap across the walls in a wild dance, accompanied by eerie noises. You collapse as a sharp pain manifests itself in your temples. Then, as suddenly as it has come, it is all over.";
	say "[line break]You find yourself in your office. The laptop is on your desk and you are ready to work.";
	say paragraph break;
	say paragraph break;
	say "   *** You have won ***";
	say paragraph break;
	say "In that game you scored [score] out of a possible [maximum score], in [turn count] turns."; 
	say paragraph break;
	say "Would you like to RESTART, RESTORE a saved game, QUIT or UNDO the last command?";
	wait for any key;
	say paragraph break;
	say "... and suddenly you wake up. It must have been some kind of daydream. A very vivid one, indeed, but still just a dream. You find yourself lying on your sofa in the living room and you have no idea how you got here. You realize that you still did not get into the office room. At least not in this reality.";
	now the player is on the sofa.
	

Chapter Game

Section The Bedroom

The Bedroom is a room. "Your bedroom is barely big enough for the bed and a small closet. The air is a bit stuffy in here. Through a small window in the north wall you can see that it's still dark outside, which is to be expected at this early hour. The only exit is south to the living room."

The bed is an enterable supporter that is scenery in the Bedroom. "Unmade, but it still looks inviting. That's probably because you feel so tired[if sufficient caffeine saturation is false]. How you would love to lie down and sleep for another hour. As an alternative, a big cup of hot black coffee might do[otherwise]. On the other hand, after the coffee, the urge to lie down and sleep is not so overwhelming anymore[end if]."

The player is on the bed.

After entering the bed:
	say "You lie down and more or less immediately doze off until you are half asleep. You shortly consider to just let go and get some more sleep. But then again, you really have to start working now and get something done.".

[
TODO Doesn't work correctly - but does not need to be included anyway
Instead doing something other than getting off when the player is on the bed (this is the get-out-of-bed-first rule):
	say "You are just too drousy to do anything useful. You'll have to get off the bed first.".
The get-out-of-bed-first rule is listed first in before.
TODO: Add examining, looking or taking inventory to list of actions allowed while on bed
]

The closet is a openable and closed container that is scenery in the bedroom. "Just a closet, where you keep your clothes.[if closet is open] Inside the open closet you can see t-shirts, jeans, a few suits, the usual stuff. Nothing exciting[otherwise] It is closed[end if]."
Instead of searching the closet:
	if the closet is open:
		say "You find nothing unexpected. Just t-shirts, jeans, a few suits, the usual stuff.";
	otherwise:
		say "That's a bit difficult, mainly because it is closed."

The bedroom window is a window. It is scenery in the bedroom.

The power supply is hidden under the bed. 
The power supply incorporates a power-supply-plug-kind.
The power supply is broken.
Understand "search under [something]" as looking under.
Instead of searching the bed: try looking under the bed.
To say find-hidden-under (the bed - a thing):
    say "Under the bed you discover the power supply of your laptop that you have been missing since the day before yesterday. You knew it had to be somewhere. But somehow it looks weird.".
The initial appearance of the power supply is "The [if the power supply is broken]broken [otherwise]improvisionally fixed [end if]power supply is lying on the floor." 

The description of the power supply is "The power supply of your laptop. [if the power supply is broken]Or rather, most of it. The plug for the wall outlet is missing and the power cord (which the plug should be attached to) ends in bare wires[end if][if the power supply is not broken]The broken power cord has been fixed, though the fix does not look exactly like the work of a professional[end if]."
After taking the power supply when the power is not handled:
	increase the score by 3;
	say "You crawl halfway under the bed and pull the power supply by the cable. Something is seriously wrong with it. The power cord (which is supposed to connect the unit to the wall outlet) has been ripped in two. The power plug is missing completely. Looks like the dog of your neighbour had some fun with it the last time you watched (or rather, failed to watch) after it, two days ago. It must have used the power supply as a sort of toy when you were inattentive, leaving it under the bed in the end. Luckily, the power supply unit itself and the cable that would connect to your laptop look undamaged.".
	 [TODO This stuff with the dog needs to be reworked.]

Section The Living Room

The Living Room is a south of the bedroom. "The living room of your tiny, over-priced flat. As untidy as usual. Large windows open to the south and provide a nice view of the city (or would, if it weren't still dark outside). A door to the north leads back to the bedroom. To the west is the hallway and the kitchen is to the east."

A low table is here. "There is a low table in front of the sofa."

On it is the laptop.
The laptop's power supply socket is a power-supply-socket-kind. The laptop incorporates the laptop's power supply socket.
The laptop's power button is part of the laptop.
The description of the laptop is "Among many other sockets, the laptop has a socket for it's power supply. It also has a power button."

After taking the laptop:
	say "You fetch the laptop from the table. You spend yesterday evening and a good part of the night slouching about on the sofa, watching TV without paying attention and at the same time surfing the internet. You don't even remember exactly what pages in particular you were reading, probably meaningless nonsense, as usual. You did so until the battery was sucked empty. Being too lazy to search for the power supply, you finally went to bed[if the power supply is off-stage]. If only you could remember where you put the power supply[otherwise]. At least you have found the power supply by now[end if][if the power supply is on-stage and the power supply is broken], even if it is still broken[end if].";
	[TODO: Add power on/off switch and make it work when plugged into outlet in the kitchen.]
	increase the score by 1.

A floor lamp is fixed in place in the living room. "Crammed into one corner is an old floor lamp."
The description of the floor lamp is "A shabby old thing. You should have thrown it out of your flat ages ago but never got around to do so. Its power plug is not even connected to a wall outlet, so the only purpose it serves is to gather dust on its lamp shade. You have even tripped over the power cord a few times."

The floor lamp's power cord is part of the floor lamp. The description of it is "A black power cord, ending in [if the floor lamp's power plug is part of the floor lamp's power cord]a standard power plug[otherwise]bare wires[end if]."
The floor lamp's power plug is part of the floor lamp's power cord. The description of it is "[if the floor lamp's power plug is part of the floor lamp's power cord]The power plug is firmly connected to the floor lamp's power cord[otherwise if the floor lamp's power plug is part of the power supply]The power plug is connected to your laptop's power supply[otherwise]The power plug that you have cut from the power cord of the floor lamp. The short cable that comes out of the plug ends in bare wires[end if]."
The floor lamp's power plug incorporates a power-plug-kind.

The living room window is a window. It is scenery in the living room.

The sofa is an enterable supporter that is scenery in the living room.
Understand "couch" as sofa.

Section The Kitchen

The Kitchen is east of the Living Room. "The kitchen is very narrow, though quite long. Lined up at the left side is the fridge, the kitchen counter, the sink, the oven and a cupboard. A rather large coffee machine and a toaster nearly fill the small kitchen counter. Behind them you can see a wall outlet. A tiny kitchen table with two chairs is at the north end[if has-made-mess is true]. 

Coffee has been spilled all over the kitchen counter, but you have no time to clean that up now[end if][if the tap is switched on].

The tap is switched on and water flows into the sink[end if].

The only exit is west, to the living room."

The sink is scenery in the kitchen. "Above the sink is a tap[if the tap is switched on]. It is turned on[otherwise]. It is turned off[end if]." The sink is an open container. The tap is part of the sink. The tap is a device.
Instead of examining the tap:
	if the tap is switched on:
		say "The tap is currently turned on.";
	otherwise:
		say "The tap is currently turned off.";

The oven is scenery in the kitchen.

The fridge is a closed openable container. The fridge is scenery in the kitchen.  
The pack of cheese is a closed, openable, transparent container in the fridge. Two slices of cheese are in the pack of cheese. 

The cupboard is a closed openable container. The cupboard is scenery in the kitchen.
A knife is in the cupboard. 
A cup is in the cupboard. 

The kitchen counter is scenery in the kitchen. "Framed by the fridge and the oven, it is barely big enough for the coffee machine and the toaster. You notice a wall outlet behind the coffee machine and the toaster, mounted just above the kitchen counter[if has-made-mess is true]. A lot of coffee has been spilled all around the coffee machine and some is dropping from the kitchen counter to the floor. However, you have no time to clean that up now[end if]."

The wall outlet is a wall-outlet-kind. The wall outlet is scenery. The wall outlet is in the kitchen.

The coffee machine is an electric device. "A quite expensive bean-to-cup coffee brewer. It is probably also capable of making all sorts of coffee specialties like Cappuccino, Espresso, Latte Macchiato, Ristretto and what not. You never got around to read that part in the manual, though. That's why you just stuck with making plain coffee with it. There is a single button on the front. It is labelled with a stylized cup of coffee. The coffee machine also has a power cord with a power plug[if the coffee machine is powered].

The display reads [display-text][otherwise].

The display is unlit[end if]."
The coffee machine is scenery on the kitchen counter.

The display is part of the coffee machine. The description of the display is "[if the coffee machine is powered]It reads [display-text][otherwise]It is unlit and displays no text[end if]."

The toaster is an electric device. "A classically styled two slot chrome toaster. It has a lever on one side that can be pushed to activate the toaster. It also has a power cord with a power plug."
The toaster is scenery on the kitchen counter.

[Both electric devices, the coffee machine and the toaster are initially not plugged in. That is by design. Also, there is only one wall outlet for both of them, so the player has to plug in and out a bit.]

The kitchen table is scenery in the kitchen.

The pack of toast is a closed, openable, transparent container on the kitchen table. Ten untoasted pieces of toast are in the pack of toast. 

Section The Hallway

The Hallway is west of the Living Room. "A small corridor that is west of the living room. A door to the north leads to the bathroom, the opposite door to the south leads to your home office room. The apartment entrance door is to the west."
Nirvana is west of the hallway.

Instead of going west from the hallway:
	say "You can't leave your flat now, not with all the work that you need to do today."

The apartment entrance is scenery in the hallway.
Understand "door" as apartment entrance.

Instead of opening the apartment entrance:
	say "You can't leave your flat now, not with all the work that you need to do today."

Section The Bathroom

The Bathroom is north of the Hallway. "The bathroom features a shower, a toilet and a basin. There is a cheap mirror cabinet mounted to the wall above the basin. You can't help admiring the interior design skills that must have been at work to stuff all these things into this extremely tiny room. As a result, a good amount of agility and physical fitness is needed to maneuver here. The only exit is to the south."

The toilet is scenery in the bathroom.
The shower is scenery in the bathroom.
The basin is scenery in the bathroom.
The mirror cabinet is an openable closed container that is scenery in the bathroom.
The toothbrush and the toothpaste are in the mirror cabinet. The description of the toothpaste is "A tube of Xyzzydent, your favorite brand. [if toothpaste is open]It is open[otherwise]It is closed[end if]." The description of the toothbrush is "A simple toothbrush. People often use toothbrushes to brush their teeth[if toothbrush is toothpasted] There is some toothpaste on it[end if]." 
Understand "Xyzzydent" as toothpaste.

Section The Office

The Office is south of the Hallway.


Chapter Test Support - Not for release

Test-cup-filling is an action applying to nothing.
understand "test-fill-cup" as test-cup-filling.

Carry out test-cup-filling:
	now the player carries the cup;
	now the cup is full-of-coffee.

Report test-cup-filling:
	say "test-fill-cup done."

[
Section Inform Tests - Not for release
]

[TEST SCRIPTS]

[
Test oob with "out. look under bed."
Test finish_bare with "go south " in the Hallway.
Test finish_coffee with "drink coffee / go south " in the Hallway holding the cup.
Test finish_toast with "drink coffee / eat toast / go south " in the Hallway holding one piece of toast and the cup.
Test finish_laptop with "drink coffee / eat toast / go south " in the Hallway holding one piece of toast, the cup and the laptop.
Test  finish_power with "drink coffee / eat toast / go south " in the Hallway holding one piece of toast, the cup, the laptop and the power supply.
Test  finish_fixing with "drink coffee / eat toast / fix power supply / go south " in the Hallway holding one piece of toast, the cup, the laptop and the power supply.

Test fix with "attach plug to supply" in the Living Room holding the power supply and the power plug.

Test all with "test finish_bare / test finish_coffee / test finish_toast / test finish_laptop / test finish_power / test finish_fixing"
]

[
Section 2/2 - Unit Tests - Not for release

[For use with Simple Unit Tests by Dannii Willis]

Unit test (this is the 1 rule):
	try going south;
	try getting off the bed;
	try going west;
	try going south;
	assert that the player is in the hallway.

...even something simple as try going south breaks with the Unit Tests extension - this is quite unusable, I think
]