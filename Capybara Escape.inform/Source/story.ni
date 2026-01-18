"Capybara Escape" by Petra

Release along with an interpreter.
Release along with a website.


[POCETAK IGRE]

When play begins:
say "You wake up in a cold room, the floor is stone and you are surrounded by metal bars, it's a cage. Somewhere inside is your friend, you know you have to find him as soon as possible and escape."

[KREIRANJE SOBA/PROSTORA]

The Capybara Cage is a room.
"The bars are old but sturdy, in the distance you see light, it's the exit to the performance stage."

The Performance Stage is east of the Capybara Cage.
"The sandlike ground is littered with objects left behind by the audience. The stage is big enough to do a dance, you can even do a flip!"

The Hallway is north of the Performance Stage.
"A narrow hallway stretches through the circus, dust and dirt covering the floor."

The Storage Room is west of the Hallway.
"Old costumes and props surround you everywhere."

The Old Cage is east of the Hallway.
"A small dark cage, there is a old capybara watching you."

The Guard Room is north of the Hallway.
"A dark wooden table is in the middle of the room, a circus guard is sitting behind it, half-asleep. There is a small key on the table."

The Friends Cage is a room.
The printed name of the Friends Cage is "Friend's Cage".
"Your friend looks at you approaching, he smiles knowing you came to save him."

The Sewer Entrance is a room.
"A heavy metal grate is blocking a dark tunnel that goes way beneath the circus."


[POSEBNE AKCIJE]

Dancing is an action applying to nothing.
Understand "dance" as dancing.

Check dancing when the location is not the Performance Stage:
	say "This doesn't feel like the right place to dance." instead.

Carry out dancing:
	say "You dance to imaginary circus music and you slay!!!"

Flipping is an action applying to nothing.
Understand "do a flip" or "flip" as flipping.

Check flipping when the location is not the Performance Stage:
	say "There's not enough space to do a flip here." instead.

Carry out flipping:
	say "You do a flip. Nailed it!!"
	
Instead of using something:
say "You're not sure how to use that here."
	
[PRIKAZ GDJE SU PROSTORIJE sa LOOK]


Definition: a direction (called thataway) is viable if the room thataway from the location is a room.

Exits-shown-once is a truth state that varies.
Exits-shown-once is false.

After looking when the room-describing action is the looking action:
	if exits-shown-once is false:
		now exits-shown-once is true;
		continue the action;
	repeat with way running through viable directions:
		let place be the room way from the location;
		say "[way]: [the place][line break]".


[PREDMETI]

An apple is in the Performance Stage.
A banana is in the Performance Stage.
Some peanuts are in the Performance Stage.

The initial appearance of the peanuts is "Some peanut shells and a small pile of peanuts are scattered around."

After taking the peanuts for the first time:
	say "You scoop up the peanuts.";
	continue the action.

After taking the banana for the first time:
	say "You pick up a ripe banana.";
		continue the action.

After taking the apple for the first time:
	say "You pick up a shiny red apple.";
		continue the action.
	
After taking something for the first time:
	say "Good thing you can store it in your inventory."

A ball is in the Hallway.
Understand "round object" or "something round" as the ball.
The initial appearance of the ball is "You see something round in the middle of the hallway."
The description of the ball is "A rubber ball, scuffed from use."

After taking the ball for the first time:
	now the printed name of the ball is "ball";
	say "You pick it up—it's a ball."
	
A small mirror is in the Storage Room.
Understand "reflective object" or "something reflective" as the small mirror.
The printed name of the small mirror is "reflective object".
The initial appearance of the small mirror is "Something reflective catches your eye among the props."
The description of the small mirror is "A small mirror, still clean enough to flash light."

After taking the small mirror for the first time:
	now the printed name of the small mirror is "small mirror";
	say "It's a small mirror."

A food bundle is a thing.
The food bundle is nowhere.
The description of the food bundle is "A bundle of food tied together. It smells delicious."
A metal key is in the Guard Room.
A rusty crowbar is in the Friends Cage.

The rusty crowbar is in the Friends Cage.
Understand "crowbar" or "rusty crowbar" or "something rusty" or "metal bar" or "bar" or "something long and rusty" as the rusty crowbar.

The printed name of the rusty crowbar is "rusty metal tool".
The initial appearance of the rusty crowbar is "Something long and rusty lies near the bars."
The description of the rusty crowbar is "A heavy rusty crowbar—perfect for prying things open."

After taking the rusty crowbar for the first time:
	now the printed name of the rusty crowbar is "rusty crowbar";
	say "You pick it up—it’s a rusty crowbar."
	
[LIKOVI]


The old capybara is a woman in the Old Cage.

The circus guard is a man in the Guard Room.
The circus guard is fixed in place.

The friend is a person in the Friends Cage.
The friend is fixed in place.

[STANJA IGRE]

The friend-following is a truth state that varies.
The friend-following is false.

The banana-eaten is a truth state that varies.
The apple-eaten is a truth state that varies.

The banana-eaten is false.
The apple-eaten is false.

[HRANA I LOGIKA]

Instead of eating the peanuts:
	say "You munch on the peanuts. Tastyy!";
	remove the peanuts from play.
	
Instead of eating the banana:
	say "You eat the banana. It was filling but maybe you shouldn't have :(";
	now the banana-eaten is true;
	move the banana to the Performance Stage.
	
Instead of eating the apple:
	say "You eat the apple. It was sweet and refreshing but maybe you shouldn't have :(";
	now the apple-eaten is true;
	move the apple to the Performance Stage.
	
	
Combining food is an action applying to nothing.
Understand "combine apple and banana" as combining food.
Understand "combine banana and apple" as combining food.


After taking the banana:
	now the banana-eaten is false.

After taking the apple:
	now the apple-eaten is false.


Check combining food:
	if banana-eaten is true or apple-eaten is true:
		say "You already ate part of the food. There isn't enough left to make a food bundle." instead;
	if the player does not carry the banana or the player does not carry the apple:
		say "You need both a banana and apple" instead.
			
Carry out combining food:
	remove the banana from play;
	remove the apple from play;
	move the food bundle to the player.
	
Report combining food:
	say "You carefully tie the banana and apple together into a food bundle."
	
[STARA CAPYBARA]
	

The capybara-fed is a truth state that varies.
The capybara-fed is false.

Instead of giving the food bundle to the old capybara:
	remove the food bundle from play;
	now capybara-fed is true;
	say "'Ahh... delicious, this takes me back,' she whispers.
	'The key you seek lies on the circus guard's table. He will only stand up and move from the table if something distracts him.'"

Instead of giving something to the old capybara:
	say "'No, no,' she says. 'That won't help me remember. But a food bundle combined of two fruits might help ;)'"
	

Instead of asking the old capybara about "guard":
	if capybara-fed is false:
		say "'No, no,' she says. 'That won't help me remember. But a food bundle combined of two fruits might help ;)'.";
	otherwise:
		say "'The key you seek lies on the circus guard's table. He will only stand up and move from the table if something distracts him.'".

Instead of asking the old capybara about "circus guard":
	if capybara-fed is false:
		say "'No, no,' she says. 'That won't help me remember. But a food bundle combined of two fruits might help ;)'.";
	otherwise:
		say "'The key you seek lies on the circus guard's table. He will only stand up and move from the table if something distracts him.'".

[CUVAR I KLJUC]

The person can be alert, distracted, or gone.
The circus guard is alert.

Instead of taking the metal key when the circus guard is alert:
	say "The circus guard catches you immediately. Everything darkens...";
	move the player to the Capybara Cage.
	
[UPOTREBA PREDMETA]

Using is an action applying to one thing.
Understand "use [something]" as using.

Instead of using the small mirror when the location is the Guard Room and the circus guard is alert:
	say "The circus guard squints at the reflection, unfazed."

Instead of dropping the ball when the location is the Guard Room and the circus guard is alert:
	say "The ball hits the wall with a loud thud. The circus guard stands up from his table to investigate. He moves away from the table towards the wall.";
	now the circus guard is distracted.

Instead of using the small mirror in the Guard Room when the circus guard is distracted:
	say "Light flashes down the hallway. The circus guard storms after it.";
	now the circus guard is gone;
	now the circus guard is nowhere.
	


Instead of taking the metal key when circus guard is distracted:
	say "You snatch the key and quickly hide under the table.";
	now the player carries the metal key.

[RESET I NEUSPJEH]

To reset-to-start:
	if the player carries the metal key:
		move the metal key to the Guard Room;
	if the player carries the ball:
		move the ball to the Hallway;
	otherwise if the ball is not in the Hallway:
		move the ball to the Hallway;
	now the circus guard is alert;
	move the circus guard to the Guard Room;
	say "The circus guard catches you immediately. Everything darkens...";
	move the player to the Capybara Cage.


Instead of going south from the Guard Room when the circus guard is alert or the circus guard is distracted:
	reset-to-start.

Instead of going east from the Guard Room when the circus guard is alert or the circus guard is distracted:
	reset-to-start.
	

[VRATA I BIJEG]


The friends cage door is a locked door.
It is east of the Guard Room and west of the Friends Cage.

Instead of going east from the Guard Room when the friends cage door is locked:
	say "It seems to be locked."


Instead of using the metal key when the location is the Guard Room:
	if the circus guard is not gone:
		reset-to-start;
	otherwise if the friends cage door is unlocked:
		say "The cage door is already unlocked.";
	otherwise:
		say "You use the key. The lock clicks open.";
		now the friends cage door is unlocked;
		now the friends cage door is open;
		now friend-following is true.


Every turn when friend-following is true:
	if the location of the friend is not the location of the player:
		move the friend to the location of the player.

The sewer grate is a door.
It is north of the Friends Cage and south of the Sewer Entrance.
The sewer grate is lockable and locked.

Instead of going north from the Friends Cage when the sewer grate is closed:
	say "The grate blocks the way. Maybe you can pry it open with something."

Instead of using the rusty crowbar when the location is the Friends Cage:
	if friend-following is false:
		say "You can't move it alone.";
	otherwise:
		say "Together you move the grate with a loud screech.";
		now the sewer grate is open.

After going to the Sewer Entrance:
	say "You and your friend climb out through the tunnel and escape into the night!";
	end the story finally saying "You escaped!"

