// leader agent

/* quadrant allocation */

@quads[atomic]
+gsize(S,W,H) : depot(A,X,Y)
  <- // calculates the area of each quadrant and remembers them
     .print("init");
     !inform_quad(S,agenti_miner1,role(miner));
     !inform_quad(S,agenti_miner2,role(miner));
     !inform_quad(S,agenti_miner5,role(miner));
     !inform_quad(S,agenti_miner6,role(miner));
     !inform_quad(S,agenti_miner3,role(miner));
     !inform_quad(S,agenti_miner4,role(miner)).

//+finished[source(Ag)] 
// only informs the quadrant if the depot is not in the quadrant
+!inform_quad(S,Miner,Q)
  :  true
  <- .send(Miner,tell,Q).

+!inform_quad(_,Miner,x)
  <- .print("Miner ",Miner," is assigned ", x).
	 
+!make_miner(Miner)
  <- .send(Miner,untell,role(scout));
  	 .send(Miner,tell,role(miner)).

+!make_scout(Miner)
  <- .send(Miner,untell,role(miner));
  	 .send(Miner,tell,role(scout)).
	 
+designate_agents[source(agenti_miner1)] : count(gold(_,_), X) & X > 10
  <- !make_miner(agenti_miner1);
	 !make_miner(agenti_miner2);
	 !make_miner(agenti_miner3);
	 !make_miner(agenti_miner4);
	 !make_miner(agenti_miner5);
	 !make_miner(agenti_miner6).

+designate_agents[source(agenti_miner1)] : steps(_, Y) & X > 4
  <- !make_miner(agenti_miner1);
	 !make_miner(agenti_miner2);
	 !make_miner(agenti_miner3);
	 !make_miner(agenti_miner4);
	 !make_miner(agenti_miner5);
	 !make_scout(agenti_miner6).

+designate_agents[source(agenti_miner1)] : steps(_, Y) & X > 3
  <- !make_miner(agenti_miner1);
	 !make_miner(agenti_miner2);
	 !make_miner(agenti_miner3);
	 !make_miner(agenti_miner4);
	 !make_scout(agenti_miner5);
	 !make_scout(agenti_miner6).

+designate_agents[source(agenti_miner1)] : steps(_, Y) & X > 2
  <- !make_miner(agenti_miner1);
	 !make_miner(agenti_miner2);
	 !make_miner(agenti_miner3);
	 !make_scout(agenti_miner4);
	 !make_scout(agenti_miner5);
	 !make_scout(agenti_miner6).
	 
+designate_agents[source(agenti_miner1)] : steps(_, Y) & X > 1
  <- !make_miner(agenti_miner1);
	 !make_miner(agenti_miner2);
	 !make_scout(agenti_miner3);
	 !make_scout(agenti_miner4);
	 !make_scout(agenti_miner5);
	 !make_scout(agenti_miner6).
	 
+designate_agents[source(agenti_miner1)] : steps(_, Y) & X > 0
  <- !make_miner(agenti_miner1);
	 !make_scout(agenti_miner2);
	 !make_scout(agenti_miner3);
	 !make_scout(agenti_miner4);
	 !make_scout(agenti_miner5);
	 !make_scout(agenti_miner6).
	 
+designate_agents[source(agenti_miner1)] : steps(_, Y) & X > -1
  <- !make_scout(agenti_miner1);
	 !make_scout(agenti_miner2);
	 !make_scout(agenti_miner3);
	 !make_scout(agenti_miner4);
	 !make_scout(agenti_miner5);
	 !make_scout(agenti_miner6).

/* negotiation for found gold */

+bid(Gold,D,Ag)
  :  .count(bid(Gold,X,Y),3)  // five bids were received
  <- //.print("bid from ",Ag," for ",Gold," is ",D);
     !allocate_miner(Gold);
     .abolish(bid(Gold,X,Y)).
+bid(Gold,D,Ag)
  <- .print("bid from ",Ag," for ",Gold," is ",D).

+!allocate_miner(Gold)
  <- .findall(op(Dist,A),bid(Gold,Dist,A),LD);
     .min(LD,op(DistCloser,Closer));
     DistCloser < 10000;
     .print("Gold ",Gold," was allocated to ",Closer, " options ware ",LD);
     .broadcast(tell,allocated(Gold,Closer)).
     //-Gold[source(_)].
-!allocate_miner(Gold)
  <- .print("could not allocate gold ",Gold).

// if some announce gold, cancel previous allocation
+gold(X,Y)[source(Ag)]
  <- .broadcast(untell, allocated(gold(X,Y),Ag)).
     .abolish(gold(_,_)).

