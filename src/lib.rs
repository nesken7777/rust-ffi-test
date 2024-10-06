use lean_sys::{lean_box, lean_box_uint64, lean_io_result_mk_ok, lean_obj_res};

use rand::{thread_rng, Rng};

#[no_mangle]
pub extern "system" fn my_add(a: u32, b: u32) -> u32 {
    a + b
}

#[no_mangle]
pub extern "system" fn random_num() -> lean_obj_res {
    unsafe { lean_io_result_mk_ok(lean_box_uint64(u64::from(thread_rng().gen::<u8>()))) }
}

#[no_mangle]
pub extern "system" fn my_lean_fun() -> lean_obj_res {
    println!("こんにちは。出力できてるよ");
    unsafe { lean_io_result_mk_ok(lean_box(0)) }
}
