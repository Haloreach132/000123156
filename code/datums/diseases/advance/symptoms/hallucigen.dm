/*
//////////////////////////////////////

Hallucigen

	Very noticable.
	Lowers resistance considerably.
	Decreases stage speed.
	Reduced transmittable.
	Critical Level.

Bonus
	Makes the affected mob be hallucinated for short periods of time.

//////////////////////////////////////
*/

/datum/symptom/hallucigen
	name = "Hallucigen"
	stealth = -2
	resistance = -3
	stage_speed = -3
	transmittable = -1
	level = 5
	severity = 3

/datum/symptom/hallucigen/Activate(datum/disease/advance/A)
	..()
	if(prob(SYMPTOM_ACTIVATION_PROB))
		var/mob/living/carbon/M = A.affected_mob
		switch(A.stage)
			if(1, 2)
				to_chat(M, span_warning(pick("Something appears in your peripheral vision, then winks out.", "You hear a faint whisper with no source.", "Your head aches.")))
			if(3, 4)
				to_chat(M, span_boldwarning(pick("Something is following you.", "You are being watched.", "You hear a whisper in your ear.", "Thumping footsteps slam toward you from nowhere.")))
			else
				to_chat(M, span_userdanger(pick("Oh, your head...", "Your head pounds.", "They're everywhere! Run!", "Something in the shadows...")))
				M.hallucination = rand(5, 10)

	return
