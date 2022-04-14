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

+tick(X)[source(agenti_miner1)] : steps(_, Y) & X > 0.8 * Y
  <- !make_miner(agenti_miner1);
	 !make_miner(agenti_miner2);
	 !make_miner(agenti_miner3);
	 !make_miner(agenti_miner4);
	 !make_miner(agenti_miner5);
	 !make_miner(agenti_miner6).
	 
+tick(X)[source(agenti_miner1)] : steps(_, Y) & X > 0.7 * Y
  <- !make_miner(agenti_miner1);
	 !make_miner(agenti_miner2);
	 !make_miner(agenti_miner3);
	 !make_miner(agenti_miner4);
	 !make_miner(agenti_miner5);
	 !make_miner(agenti_miner6).
	 
+tick(X)[source(agenti_miner1)] : steps(_, Y) & X > 0.6 * Y
  <- !make_miner(agenti_miner1);
	 !make_miner(agenti_miner2);
	 !make_miner(agenti_miner3);
	 !make_miner(agenti_miner4);
	 !make_miner(agenti_miner5);
	 !make_miner(agenti_miner6).

+tick(X)[source(agenti_miner1)] : steps(_, Y) & X > 0.5 * Y
  <- !make_miner(agenti_miner1);
	 !make_miner(agenti_miner2);
	 !make_miner(agenti_miner3);
	 !make_miner(agenti_miner4);
	 !make_miner(agenti_miner5);
	 !make_scout(agenti_miner6).

+tick(X)[source(agenti_miner1)] : steps(_, Y) & X > 0.4 * Y
  <- !make_miner(agenti_miner1);
	 !make_miner(agenti_miner2);
	 !make_miner(agenti_miner3);
	 !make_miner(agenti_miner4);
	 !make_miner(agenti_miner5);
	 !make_scout(agenti_miner6).
	 
+tick(X)[source(agenti_miner1)] : steps(_, Y) & X > 0.3 * Y
  <- !make_miner(agenti_miner1);
	 !make_miner(agenti_miner2);
	 !make_miner(agenti_miner3);
	 !make_miner(agenti_miner4);
	 !make_scout(agenti_miner5);
	 !make_scout(agenti_miner6).
	 
+tick(X)[source(agenti_miner1)] : steps(_, Y) & X > 0.2 * Y
  <- !make_miner(agenti_miner1);
	 !make_miner(agenti_miner2);
	 !make_miner(agenti_miner3);
	 !make_miner(agenti_miner4);
	 !make_scout(agenti_miner5);
	 !make_scout(agenti_miner6).
	 
+tick(X)[source(agenti_miner1)] : steps(_, Y) & X > 0.1 * Y
  <- !make_miner(agenti_miner1);
	 !make_miner(agenti_miner2);
	 !make_miner(agenti_miner3);
	 !make_miner(agenti_miner4);
	 !make_miner(agenti_miner5);
	 !make_scout(agenti_miner6).
	 
+tick(X)[source(agenti_miner1)] : steps(_, Y) & X > 0.0 * Y
  <- !make_miner(agenti_miner1);
	 !make_miner(agenti_miner2);
	 !make_miner(agenti_miner3);
	 !make_miner(agenti_miner4);
	 !make_miner(agenti_miner5);
	 !make_scout(agenti_miner6).
	 
/*
+!designate_miners : .count(gold(_,_), X) & X > 40
  <- !make_miner(agenti_miner1);
	 !make_miner(agenti_miner2);
	 !make_miner(agenti_miner3);
	 !make_miner(agenti_miner4);
	 !make_miner(agenti_miner5);
	 !make_miner(agenti_miner6).

+!designate_miners : .count(gold(_,_), X) & X > 25
  <- !make_miner(agenti_miner1);
	 !make_miner(agenti_miner2);
	 !make_miner(agenti_miner3);
	 !make_miner(agenti_miner4);
	 !make_miner(agenti_miner5);
	 !make_scout(agenti_miner6).

+!designate_miners : .count(gold(_,_), X) & X > 15
  <- !make_miner(agenti_miner1);
	 !make_miner(agenti_miner2);
	 !make_miner(agenti_miner3);
	 !make_miner(agenti_miner4);
	 !make_scout(agenti_miner5);
	 !make_scout(agenti_miner6).
	 
+!designate_miners : .count(gold(_,_), X) & X > 10
  <- !make_miner(agenti_miner1);
	 !make_miner(agenti_miner2);
	 !make_miner(agenti_miner3);
	 !make_scout(agenti_miner4);
	 !make_scout(agenti_miner5);
	 !make_scout(agenti_miner6).
	 
+!designate_miners : .count(gold(_,_), X) & X > 6
  <- !make_miner(agenti_miner1);
	 !make_miner(agenti_miner2);
	 !make_scout(agenti_miner3);
	 !make_scout(agenti_miner4);
	 !make_scout(agenti_miner5);
	 !make_scout(agenti_miner6).
	 
+!designate_miners : .count(gold(_,_), X) & X > 3
  <- !make_miner(agenti_miner1);
	 !make_scout(agenti_miner2);
	 !make_scout(agenti_miner3);
	 !make_scout(agenti_miner4);
	 !make_scout(agenti_miner5);
	 !make_scout(agenti_miner6).
	 
+!designate_miners : .count(gold(_,_), X) & X > -1
  <- !make_scout(agenti_miner1);
	 !make_scout(agenti_miner2);
	 !make_scout(agenti_miner3);
	 !make_scout(agenti_miner4);
	 !make_scout(agenti_miner5);
	 !make_scout(agenti_miner6).
	 
//------------------------------------------------------------------------------------
	 
-gold(_,_)  : .count(gold(_,_), X) & X > 40
  <- !make_miner(agenti_miner1);
	 !make_miner(agenti_miner2);
	 !make_miner(agenti_miner3);
	 !make_miner(agenti_miner4);
	 !make_miner(agenti_miner5);
	 !make_miner(agenti_miner6).

-gold(_,_) : .count(gold(_,_), X) & X > 25
  <- !make_miner(agenti_miner1);
	 !make_miner(agenti_miner2);
	 !make_miner(agenti_miner3);
	 !make_miner(agenti_miner4);
	 !make_miner(agenti_miner5);
	 !make_scout(agenti_miner6).

-gold(_,_) : .count(gold(_,_), X) & X > 15
  <- !make_miner(agenti_miner1);
	 !make_miner(agenti_miner2);
	 !make_miner(agenti_miner3);
	 !make_miner(agenti_miner4);
	 !make_scout(agenti_miner5);
	 !make_scout(agenti_miner6).
	 
-gold(_,_) : .count(gold(_,_), X) & X > 10
  <- !make_miner(agenti_miner1);
	 !make_miner(agenti_miner2);
	 !make_miner(agenti_miner3);
	 !make_scout(agenti_miner4);
	 !make_scout(agenti_miner5);
	 !make_scout(agenti_miner6).
	 
-gold(_,_): .count(gold(_,_), X) & X > 6
  <- !make_miner(agenti_miner1);
	 !make_miner(agenti_miner2);
	 !make_scout(agenti_miner3);
	 !make_scout(agenti_miner4);
	 !make_scout(agenti_miner5);
	 !make_scout(agenti_miner6).
	 
-gold(_,_) : .count(gold(_,_), X) & X > 3
  <- !make_miner(agenti_miner1);
	 !make_scout(agenti_miner2);
	 !make_scout(agenti_miner3);
	 !make_scout(agenti_miner4);
	 !make_scout(agenti_miner5);
	 !make_scout(agenti_miner6).
	 
-gold(_,_) : .count(gold(_,_), X) & X > -1
  <- !make_scout(agenti_miner1);
	 !make_scout(agenti_miner2);
	 !make_scout(agenti_miner3);
	 !make_scout(agenti_miner4);
	 !make_scout(agenti_miner5);
	 !make_scout(agenti_miner6).
*/
/*

     +init_pos(S,X,Y)[source(A)]
  :  gsize(S,_,_) &
     .count(init_pos(S,_,_),6) // if all miners have sent their position
  <- // remember who doesn't have a quadrant allocated
     // (initially 4 miners that will find gold by quadrant)
     +~quad(S,miner1); +~quad(S,miner2);
     +~quad(S,miner3); +~quad(S,miner4);
     //+~quad(S,miner5); +~quad(S,miner6);
     !assign_quads(S,[1,2,3,4]).


+!assign_quads(_,[]).
+!assign_quads(S,[Q|T])
  <- !assign_quad(S,Q);
     !assign_quads(S,T).

// assign the quadrant Q to a miner
+!assign_quad(S,Q)
  :  quad(S,Q,X1,Y1,X2,Y2) &
     ~quad(S,_) // there still is a miner without a quadrant
  <- .findall(Ag, ~quad(S,Ag), LAgs);
     !calc_ag_dist(S,Q,LAgs,LD);
     .min(LD,d(Dist,Ag));
     .print(Ag, "'s Quadrant is: ",Q, ": ", X1,",",Y1,"x",X2,",",Y2);
     -~quad(S,Ag);
     .send(Ag,tell,quadrant(X1,Y1,X2,Y2)).

+!calc_ag_dist(S,Q,[],[]).
+!calc_ag_dist(S,Q,[Ag|RAg],[d(Dist,Ag)|RDist])
  :  quad(S,Q,X1,Y1,X2,Y2) & init_pos(S,AgX,AgY)[source(Ag)]
  <- // get the distance between X1,Y1 and AgX,AgY
     jia.dist(X1,Y1,AgX,AgY,Dist);
     !calc_ag_dist(S,Q,RAg,RDist).

*/

/* negotiation for found gold */

+bid(Gold,D,Ag)
  :  .count(bid(Gold,X,Y),3)  // five bids were received
  <- //.print("bid from ",Ag," for ",Gold," is ",D);
     !allocate_miner(Gold);
     .abolish(bid(Gold,X,Y)).
//+bid(Gold,D,Ag)
//  <- .print("bid from ",Ag," for ",Gold," is ",D).

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

