import { SignIn } from "@/node_modules/@clerk/nextjs/dist/types";

export default function Page() {
  return (
    <div className="flex justify-center py-24">
      <SignIn />
    </div>
  );
}
