
type __sync_fetch_and_add (type *ptr, type value, /* list of variables to be protected by memory barrier */);
type __sync_fetch_and_sub (type *ptr, type value, /* list of variables to be protected by memory barrier */);
type __sync_fetch_and_or (type *ptr, type value, /* list of variables to be protected by memory barrier */);
type __sync_fetch_and_and (type *ptr, type value, /* list of variables to be protected by memory barrier */);
type __sync_fetch_and_xor (type *ptr, type value, /* list of variables to be protected by memory barrier */);
type __sync_fetch_and_nand (type *ptr, type value, /* list of variables to be protected by memory barrier */);


type __sync_add_and_fetch (type *ptr, type value, /* list of variables to be protected by memory barrier */);
type __sync_sub_and_fetch (type *ptr, type value, /* list of variables to be protected by memory barrier */);
type __sync_or_and_fetch (type *ptr, type value, /* list of variables to be protected by memory barrier */);
type __sync_and_and_fetch (type *ptr, type value, /* list of variables to be protected by memory barrier */);
type __sync_xor_and_fetch (type *ptr, type value, /* list of variables to be protected by memory barrier */);
type __sync_nand_and_fetch (type *ptr, type value, /* list of variables to be protected by memory barrier */);

bool __sync_bool_compare_and_swap (type *ptr, type oldval, type newval, /* list of variables to be protected by memory barrier */);
type __sync_val_compare_and_swap (type *ptr, type oldval, type newval, /* list of variables to be protected by memory barrier */);

/* memory barrier */
__sync_synchronize ();
